import tkinter as tk
from tkinter import font, messagebox
from telegram import Bot
from telegram.error import TelegramError
import webbrowser
import os


class FullMenu(tk.Tk):
    def init(self):
        super().init()

        self.title("Меню Приложения")
        self.geometry("1000x600")
        self.configure(bg="black")
        self.resizable(False, False)

        # Настройка шрифта
        self.custom_font = font.Font(family="Helvetica", size=14, weight="bold")

        # Создание контейнера для прокрутки
        self.canvas = tk.Canvas(self, bg="black", highlightthickness=0)
        self.scrollbar = tk.Scrollbar(self, orient="vertical", command=self.canvas.yview)

        # Настройка прокручиваемого контейнера
        self.scrollable_frame = tk.Frame(self.canvas, bg="#111111")
        self.scrollable_frame.bind(
            "<Configure>",
            lambda e: self.canvas.configure(scrollregion=self.canvas.bbox("all")),
        )
        self.canvas.create_window((0, 0), window=self.scrollable_frame, anchor="nw")
        self.canvas.configure(yscrollcommand=self.scrollbar.set)

        self.canvas.pack(side="left", fill="both", expand=True)
        self.scrollbar.pack(side="right", fill="y")

        # Старт создания столбцов и контента
        self.create_sidebar()
        self.create_main_area()

    def create_sidebar(self):
        """Создание столбцов с кнопками"""
        # Столбец "ТОООП!!!!"
        tooop_label = tk.Label(
            self.scrollable_frame,
            text="ТОООП!!!!",
            font=("Helvetica", 14, "bold"),
            fg="white",
            bg="#111111",  # Чёрный фон
        )
        tooop_label.pack(pady=5, anchor="w", padx=10)

        tooop_button = tk.Button(
            self.scrollable_frame,
            text="Перейти в Telegram",
            font=self.custom_font,
            bg="#222222",  # Тёмно-серый фон для кнопки
            fg="white",  # Белый текст
            bd=0,
            relief="flat",
            command=self.open_telegram,
        )
        tooop_button.pack(pady=5, padx=10, fill="x")

        # Столбец "Автооткрытие"
        auto_open_label = tk.Label(
            self.scrollable_frame,
            text="Автооткрытие",
            font=("Helvetica", 14, "bold"),
            fg="white",
            bg="#111111",  # Чёрный фон
        )
        auto_open_label.pack(pady=5, anchor="w", padx=10)

        auto_open_button2 = tk.Button(
            self.scrollable_frame,
            text="Открыть папку",
            font=self.custom_font,
            bg="#222222",  # Тёмно-серый фон для кнопки
            fg="white",  # Белый текст
            bd=0,
            relief="flat",
            command=self.open_folder,
        )
        auto_open_button2.pack(pady=5, padx=10, fill="x")

        # Столбец "Любимое"
        favorite_label = tk.Label(
            self.scrollable_frame,
            text="Любимое",
            font=("Helvetica", 14, "bold"),
            fg="white",
            bg="#111111",  # Чёрный фон
        )
        favorite_label.pack(pady=5, anchor="w", padx=10)

        favorite_button = tk.Button(
            self.scrollable_frame,
            text="Открыть YouTube",
            font=self.custom_font,
            bg="#222222",
            fg="white",
            bd=0,
            relief="flat",
            command=self.open_youtube,
        )
        favorite_button.pack(pady=5, padx=10, fill="x")

        # Столбец "Чатики"
        chat_label = tk.Label(
            self.scrollable_frame,
            text="Чатики",
            font=("Helvetica", 14, "bold"),
            fg="white",
            bg="#111111",  # Чёрный фон
        )
        chat_label.pack(pady=5, anchor="w", padx=10)

        chat_button = tk.Button(
            self.scrollable_frame,
            text="Перейти в Discord",
            font=self.custom_font,
            bg="#222222",
            fg="white",
            bd=0,
            relief="flat",
            command=self.open_discord,
        )
        chat_button.pack(pady=5, padx=10, fill="x")

        # Столбец "
