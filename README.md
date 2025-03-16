# Nyumbani-Landlords 🏠

> *"Nyumbani"* is a Swahili word that translates to "home".

A comprehensive digital property management solution designed to solve the challenges faced by landlords and tenants during property tenure.

![Nyumbani Banner](https://user-images.githubusercontent.com/61579772/111040217-df24d700-846c-11eb-85e0-706e692ea238.png)

## 📋 About

Nyumbani Property Manager is a powerful system that enables you to manage your properties digitally with ease and efficiency. We aim to create an ecosystem that brings:

- **🔍 Transparency**: Clear communication and documentation between all parties
- **🔒 Safety**: Secure handling of tenant information and payment processing
- **✨ Convenience**: Streamlined workflows for property management tasks

Our mission is to bridge the gap between different types of communities and residencies while simplifying the onboarding process for both landlords and tenants.

## ✅ Key Features

- **📝 Digital Lease Management**: Create, sign, and store leases electronically
- **💰 Automated Rent Collection**: Set up recurring payments and track income
- **🔧 Maintenance Request Tracking**: Streamline repair requests and scheduling
- **👥 Tenant Screening**: Verify potential tenants with integrated background checks
- **📊 Financial Reporting**: Generate detailed income and expense reports
- **💬 Communication Hub**: Centralized messaging system for landlords and tenants

## 🖥️ What's in Store

![Nyumbani Dashboard](https://user-images.githubusercontent.com/61579772/111040498-2069b680-846e-11eb-8f35-bc4489c9ee84.png)

## 🚀 Project Structure

```
Nyumbani-Landlords/
├── assets/              # Stylings, fonts, and theme resources
│   ├── css/             # Stylesheet files
│   ├── fonts/           # Custom fonts
│   └── img/             # Image resources
├── js/                  # JavaScript libraries and modules
├── plugins/             # Third-party plugins and extensions
│   ├── bootstrap-table/ # Bootstrap table components
│   ├── chart.js/        # Chart visualization library
│   └── datepicker/      # Date selection component
├── scripts/             # Common application scripts
└── web.config           # SQL connection and web configurations
```

## 🏗️ System Architecture

```mermaid
graph TD
    A[Client Browser] -->|HTTP/HTTPS| B[IIS Web Server]
    B -->|ASP.NET| C[Application Layer]
    C -->|Entity Framework| D[(SQL Database)]
    C --> E[Authentication Service]
    C --> F[Payment Processing]
    C --> G[Notification System]
    E --> H[User Management]
    F --> I[Financial Reports]
    G --> J[Email/SMS Service]
```

## 🗄️ Database Schema

```mermaid
erDiagram
    LANDLORD ||--o{ PROPERTY : owns
    PROPERTY ||--o{ UNIT : contains
    UNIT ||--o{ LEASE : has
    TENANT ||--o{ LEASE : signs
    LEASE ||--o{ PAYMENT : generates
    UNIT ||--o{ MAINTENANCE : requires

    LANDLORD {
        int landlord_id PK
        string name
        string email
        string phone
        string address
    }
    
    PROPERTY {
        int property_id PK
        int landlord_id FK
        string address
        string type
        date acquisition_date
    }
    
    UNIT {
        int unit_id PK
        int property_id FK
        string unit_number
        decimal rent_amount
        int bedrooms
        int bathrooms
        boolean occupied
    }
    
    TENANT {
        int tenant_id PK
        string name
        string email
        string phone
        date registration_date
    }
    
    LEASE {
        int lease_id PK
        int unit_id FK
        int tenant_id FK
        date start_date
        date end_date
        decimal deposit
        string lease_document
    }
    
    PAYMENT {
        int payment_id PK
        int lease_id FK
        decimal amount
        date payment_date
        string payment_method
        string status
    }
    
    MAINTENANCE {
        int request_id PK
        int unit_id FK
        string description
        date request_date
        string status
        date resolved_date
    }
```

## 💻 Code Snippets

### Connection String Setup

```xml
<!-- web.config -->
<connectionStrings>
  <add name="NyumbaniContext" 
       connectionString="Data Source=YOUR_SERVER;Initial Catalog=NyumbaniDB;Integrated Security=True" 
       providerName="System.Data.SqlClient" />
</connectionStrings>
```

### Tenant Registration Logic

```csharp
// TenantController.cs
[HttpPost]
public ActionResult Register(TenantViewModel model)
{
    if (ModelState.IsValid)
    {
        var tenant = new Tenant
        {
            Name = model.Name,
            Email = model.Email,
            Phone = model.Phone,
            RegistrationDate = DateTime.Now
        };
        
        db.Tenants.Add(tenant);
        db.SaveChanges();
        
        // Send welcome email
        EmailService.SendWelcomeEmail(tenant.Email, tenant.Name);
        
        return RedirectToAction("Dashboard", "Home");
    }
    
    return View(model);
}
```

### Rent Payment Processing

```javascript
// payment.js
function processPayment(leaseId, amount) {
    $.ajax({
        url: '/api/payments/process',
        type: 'POST',
        data: JSON.stringify({
            leaseId: leaseId,
            amount: amount,
            paymentMethod: $('#paymentMethod').val(),
            paymentDate: new Date()
        }),
        contentType: 'application/json',
        success: function(response) {
            showNotification('Payment processed successfully', 'success');
            updatePaymentHistory(leaseId);
        },
        error: function(xhr) {
            showNotification('Payment processing failed: ' + xhr.responseText, 'error');
        }
    });
}
```

## 🔧 Technical Stack

- **Frontend**: 
  - HTML5, CSS3, JavaScript
  - Bootstrap 4
  - jQuery
  - Chart.js for visualizations
  
- **Backend**: 
  - ASP.NET MVC
  - C# 
  - Entity Framework
  
- **Database**: 
  - SQL Server
  
- **Hosting**: 
  - IIS on Windows Server

## 📦 Installation

```bash
# Clone the repository
git clone https://github.com/Kuria-byte/Nyumbani-Landlords.git

# Navigate to the project directory
cd Nyumbani-Landlords

# Configure web.config with your database connection

# Set up the database
Update-Database -Verbose

# Run the application through Visual Studio or IIS
```

## 🚀 Deployment

- Currently under development
- Will support deployment to Azure and on-premises IIS servers
- Docker container support planned for future releases

## 👥 Contributing

We welcome contributions to the Nyumbani-Landlords project. Please feel free to submit pull requests or open issues to suggest improvements.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Contact

- **Project Maintainer**: [Kuria-byte](https://github.com/Kuria-byte)
- **Website**: [Ian Kuria - Software Architect](www.kuria.pro)
- **Email**: [Contact Email](ianmwitumi@gmail.com)

---

⭐ Star this repo if you find it useful! ⭐
