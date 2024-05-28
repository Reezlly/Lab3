using System;
using System.IO;

class Program
{
    static void Main(string[] args)
    {
        try
        {
            string directoryPath;
            string fileExtension;

            if (args.Length < 2)
            {
                Console.Write("Please provide the directory path: ");
                directoryPath = Console.ReadLine();

                if (!Directory.Exists(directoryPath))
                {
                    Console.WriteLine("The specified directory does not exist.");
                    Console.WriteLine("Program completed with the code 1.");
                    Environment.Exit(1); 
                }

                Console.Write("Please provide the file extension (e.g., .exe): ");
                fileExtension = Console.ReadLine();
            }
            else
            {
                directoryPath = args[0];
                fileExtension = args[1];

                if (!Directory.Exists(directoryPath))
                {
                    Console.WriteLine("The specified directory does not exist.");
                    Console.WriteLine("Program completed with the code 1.");
                    Environment.Exit(1); 
                }
            }

            string[] files = Directory.GetFiles(directoryPath, "*" + fileExtension);

            if (files.Length == 0)
            {
                Console.WriteLine($"No files with the extension '{fileExtension}' found in the directory.");
                Console.WriteLine("Program completed successfully with the code 0.");
                Environment.Exit(0); 
            }

            foreach (string file in files)
            {
                FileAttributes attributes = File.GetAttributes(file);

                if ((attributes & FileAttributes.ReadOnly) == FileAttributes.ReadOnly)
                {
                    File.SetAttributes(file, attributes & ~FileAttributes.ReadOnly);
                }

                File.Delete(file);
            }

            Console.WriteLine($"All files with the extension '{fileExtension}' have been deleted successfully.");
            Console.WriteLine("Program completed successfully with the code 0.");
            Environment.Exit(0); 
        }
        catch (Exception ex)
        {
            Console.WriteLine($"An error occurred: {ex.Message}");
            Console.WriteLine("Program completed with the code 1.");
            Environment.Exit(1); 
        }
    }
}
