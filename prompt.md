# Copilot Prompt for Bicep Infra Conversion and Automation

## User Instructions

This workspace contains Bicep infrastructure-as-code for the GraphRAG Accelerator. The following prompt was used to automate the conversion of a shell-based deployment to a fully Bicep-based, parameterized, and modular deployment, including:
- Converting all infra deployment logic to Bicep (no PowerShell or shell scripting for Azure resource creation)
- Using a `main.bicep` as the orchestration entry point
- Creating a `deploy.bicep` as the root deployment entry
- Using `.bicepparam` files for all parameterization
- Centralizing all RBAC assignments in a dedicated `RBAC.bicep` module
- Creating Bicep deployment scripts for post-deployment steps (APIM OpenAPI import, DNS A record creation)
- Ensuring all developer access and RBAC assignments are parameterized (no hardcoded user context)
- Validating all Bicep files with `bicep build` and iterating until no blocking errors remain
- Documenting which steps must remain manual (e.g., Helm install, Docker push, readiness checks)

## Example Prompt

```
This infra folder contains the bicep to support the application defined in the Readme.md. Please update the infra deployment TO NOT USE POWERSHELL. Use a main.bicep file and be sure to follow functionality listed in https://github.com/Azure/bicep If you do not know how to do something please say so and do not make any assumptions. I'd expect to see a deploy.bicep file. Additionally all paramters should leverage the .bicepparam file type
```

## Additional Instructions
- Convert all RBAC role assignments, where possible, to a dedicated RBAC.bicep file
- Use deployment scripts for post-deployment automation (APIM import, DNS)
- Parameterize developer access (objectId) and document how to retrieve it
- Validate with `bicep build` after each change
- Document any manual steps required for full deployment
- Update Azure resource provider API versions periodically to use the latest supported versions

## API Version Management

The Bicep templates in this project use specific API versions for each Azure resource type. Keeping these API versions current ensures the infrastructure deployment uses best practices and the latest capabilities. When updating API versions:

1. Check the [Azure Resource Manager reference documentation](https://learn.microsoft.com/en-us/azure/templates/) for the latest stable API versions
2. Update the API version string in each resource declaration
3. For preview features, only use preview API versions when necessary and document accordingly
4. Validate all templates after updating using `bicep build ./infra/deploy.bicep` and `az bicep build-params --file ./infra/deploy.bicepparam`
5. Update the `infra/API-VERSIONS.md` documentation with the new API versions
6. Be aware that using very recent API versions may generate "Resource type does not have types available" warnings during validation, which typically don't impact deployment

See `infra/API-VERSIONS.md` for the current API versions used in this project.

---

This prompt can be reused to recreate or extend the Bicep-based deployment automation for this project or similar Azure infrastructure projects.
