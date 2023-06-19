from django.core.management.base import BaseCommand
from django_seed import Seed
from talabaty.models import Category

categories_data = [
    {'name': 'Beef', 'slug': 'beef'},
    {'name': 'Chicken', 'slug': 'chicken'},
    {'name': 'Pizza', 'slug': 'pizza'},
    {'name': 'Beverage', 'slug': 'beverage'},
    {'name': 'Rice', 'slug': 'rice'},
    {'name': 'Salad', 'slug': 'salad'},
    {'name': 'Burger', 'slug': 'burger'},
    {'name': 'Shawarma', 'slug': 'shawarma'},
    {'name': 'Vegetables', 'slug': 'vegetables'},
    {'name': 'Burrito', 'slug': 'burrito'},
    {'name': 'Kebab', 'slug': 'kebab'},
    {'name': 'Potato', 'slug': 'potato'},
]

class Command(BaseCommand):
    help = 'Seeds categories data'

    def handle(self, *args, **options):
        seeder = Seed.seeder()
        for category_data in categories_data:
            seeder.add_entity(Category, 1, category_data)
        inserted_pks = seeder.execute()
        self.stdout.write(self.style.SUCCESS(f"Seeded {len(inserted_pks[Category])} categories"))
