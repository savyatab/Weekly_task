import asyncio

async def fetch_api(name, delay):
    print(f"Start {name}")
    await asyncio.sleep(delay)
    print(f"End {name}")
    return f"{name} done"

async def main():
    tasks = [
        fetch_api("API 1", 3),
        fetch_api("API 2", 2),
        fetch_api("API 3", 1),
    ]

    results = await asyncio.gather(*tasks)
    print("Results:", results)

asyncio.run(main())