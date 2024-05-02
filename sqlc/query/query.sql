-- name: GetRecipient :one
SELECT * FROM "recipient" WHERE "ocdMasterId" = $1;

-- name: AddRecipient :exec
INSERT INTO "recipient" ("ocdMasterId", "username", "role", "created_at")
VALUES ($1, $2, $3, $4);

-- name: UpdateRecipient :exec
UPDATE "recipient" SET "dusername" = $1, "role" = $2 WHERE "ocdMasterId" = $3;

-- name: DeleteRecipient :exec
DELETE FROM "recipient" WHERE "ocdMasterId" = $1;

-- name: GetAllSurveyUrls :many
SELECT * FROM "surveyUrl";

-- name: GetSurveyUrl :one
SELECT * FROM "surveyUrl" WHERE "ocdB2cSurveyUrlId" = $1;

-- name: AddSurveyResponse :exec
INSERT INTO "surveyResponse" ("ocdB2cSurveyResponseId", "ocdB2cSurveyUrlId", "ocdMasterId", "technicalCreationDate", "technicalLastUpdateDate", "sourceName", "url", "surveyId", "surveyStatus", "Scenario", "Channel", "relatedObjectName", "relatedObjectId", "answerDate", "endDate", "npsSegmentation")
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16);

-- name: GetSurveyResponsesBySurveyId :many
SELECT * FROM "surveyResponse" WHERE "surveyId" = $1;

-- name: GetSalesHistoryByCountry :many
SELECT * FROM "salesHistory" WHERE "country" = $1;



-- name: GetSurveyDetails :many
SELECT su."ocdB2cSurveyUrlId", su."surveyId", sr."ocdB2cSurveyResponseId", sr."surveyStatus"
FROM "surveyUrl" su
JOIN "surveyResponse" sr ON su."ocdB2cSurveyUrlId" = sr."ocdB2cSurveyUrlId"
WHERE su."brand" = $1 AND su."country" = $2;
