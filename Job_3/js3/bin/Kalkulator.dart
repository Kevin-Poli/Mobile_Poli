import 'dart:io';

void main() {
  int jmlsmt,jmlmk = 0, totalsks = 0;
  List<List<int>> sks = List.generate(50, (i) => List.generate(30, (j) => 0));
  List<int> skssmt = List.generate(14, (i) => 0);
  List<double> nr = List.generate(14, (i) => 0.0);
  double totalnr = 0.0, ipk = 0.0;
  List<List<String>> matkul = List.generate(50, (i) => List.generate(50, (j) => ""));
  List<List<String>> nilaihuruf = List.generate(50, (i) => List.generate(30, (j) => ""));

  print("==============================================");
  print("\tProgram Menghitung IPK Mahasiswa");
  print("==============================================");

  stdout.write("Masukkan jumlah semester: ");
  jmlsmt = int.parse(stdin.readLineSync()!);

  if (jmlsmt < 2 || jmlsmt > 14) {
    print("Jumlah semester salah!");
    return;
  } else {
    for (int i = 0; i < jmlsmt; i++) {
      int jumlahnilai = 0;
      int jumlahsks = 0;

      // Get input for jmlmk
      stdout.write("Masukkan jumlah mata kuliah semester ${i + 1}: ");
      jmlmk = int.tryParse(stdin.readLineSync()!) ?? 0; 

      if (jmlmk < 2) {
        print("Jumlah matakuliah kurang dari 2 setiap semester");
        return;
      } else {
        for (int j = 0; j < jmlmk; j++) {
          stdout.write("Masukkan mata kuliah ke ${j + 1}\n");
          stdout.write("Masukkan nama matkul: ");
          matkul[i][j] = stdin.readLineSync()!;
          stdout.write("Masukkan jumlah sks matkul: ");
          sks[i][j] = int.parse(stdin.readLineSync()!);
          stdout.write("Masukkan nilai matkul: ");
          nilaihuruf[i][j] = stdin.readLineSync()!;

          print("--------------------------------------------");

          int nilai;
          switch (nilaihuruf[i][j]) {
            case 'A':
              nilai = 4 * sks[i][j];
              break;
            case 'B':
              nilai = 3 * sks[i][j];
              break;
            case 'C':
              nilai = 2 * sks[i][j];
              break;
            case 'D':
              nilai = 1 * sks[i][j];
              break;
            case 'E':
              nilai = 0 * sks[i][j];
              break;
            default:
              print("Input salah!");
              return;
          }
          jumlahnilai += nilai;
          jumlahsks += sks[i][j];
        }
        if (jumlahsks > 24) {
          print("Jumlah SKS semester lebih dari 24");
          return;
        } else {
          skssmt[i] = jumlahsks;
          nr[i] = jumlahnilai / jumlahsks;
        }
      }
    }
  }

  print("==============================================");
  print("\t\tTranskrip Nilai");
  print("==============================================");

  for (int i = 0; i < jmlsmt; i++) {
    print("\nHasil Semester ${i + 1}:\n");
    print("Mata Kuliah\tSKS\tNilai");

    for (int j = 0; j < jmlmk; j++) {
      print("${matkul[i][j]}\t${sks[i][j]}\t${nilaihuruf[i][j]}");
    }
    print("\n\nSKS\t: ${skssmt[i]}");
    print("NR\t: ${nr[i].toStringAsFixed(2)}");
    totalsks += skssmt[i];
    totalnr += nr[i];
    print("--------------------------------------------");
  }

  ipk = totalnr / jmlsmt;
  print("\nTotal SKS\t: $totalsks");
  print("IPK\t\t: ${ipk.toStringAsFixed(2)}");
  print("==============================================");
}