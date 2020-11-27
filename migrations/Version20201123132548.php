<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20201123132548 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE jobs (id INT AUTO_INCREMENT NOT NULL, categorie_id_id INT NOT NULL, contrat VARCHAR(100) NOT NULL, entreprise VARCHAR(100) NOT NULL, logo VARCHAR(100) NOT NULL, url VARCHAR(255) NOT NULL, pays VARCHAR(255) NOT NULL, lieu VARCHAR(255) NOT NULL, description LONGTEXT NOT NULL, token VARCHAR(255) NOT NULL, email VARCHAR(100) NOT NULL, active TINYINT(1) NOT NULL, expire DATETIME NOT NULL, created DATETIME NOT NULL, updated DATETIME NOT NULL, postuler LONGTEXT NOT NULL, INDEX IDX_A8936DC58A3C7387 (categorie_id_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE jobs ADD CONSTRAINT FK_A8936DC58A3C7387 FOREIGN KEY (categorie_id_id) REFERENCES categories (id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE jobs');
    }
}
