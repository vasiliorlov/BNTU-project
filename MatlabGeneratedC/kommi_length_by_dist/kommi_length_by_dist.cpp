//
// File: kommi_length_by_dist.cpp
//
// MATLAB Coder version            : 4.3
// C/C++ source code generated on  : 09-Mar-2021 18:51:36
//

// Include Files
#include "kommi_length_by_dist.h"
#include "kommi_length_by_dist_data.h"
#include "kommi_length_by_dist_emxutil.h"
#include "kommi_length_by_dist_initialize.h"
#include "rand.h"
#include "rt_nonfinite.h"
#include "tic.h"
#include <cmath>

// Function Definitions

//
// константы решения
// задается количество вершин (городов)
// Arguments    : const double d[144]
//                emxArray_real_T *order
// Return Type  : void
//
void kommi_length_by_dist(const double d[144], emxArray_real_T *order)
{
  int i;
  double V[144];
  int k;
  double m2;
  int renew;
  boolean_T negx;
  int ux;
  double t;
  int ui;
  double U[144];
  double Udao[144];
  double m3;
  double m4;
  int j;
  if (isInitialized_kommi_length_by_dist == false) {
    kommi_length_by_dist_initialize();
  }

  // для одного в столбце
  // для одного в строке
  // для одного маршрута
  // для минимизации цены маршрута
  // пераметр расчета функции активации
  // шаг пересчета
  // иницилизация переменных
  i = order->size[0] * order->size[1];
  order->size[0] = 1;
  order->size[1] = 1;
  emxEnsureCapacity_real_T(order, i);
  order->data[0] = 12.0;

  // поиск маршрутов
  // получение статистики результатов
  // подсчет числа циклов расчетов
  // признак конца расчета
  do {
    // total
    //  V
    tic();

    // инициализация массива функций передачи нейрона 
    b_rand(V);

    // V
    // инициализация массива значений весов связей между нейронами 
    for (k = 0; k < 144; k++) {
      m2 = 2.0 * V[k] - 1.0;
      if (m2 < 0.0) {
        negx = true;
        m2 = -m2;
      } else {
        negx = false;
      }

      if (m2 > 1.0) {
        m2 = rtNaN;
      } else if (m2 < 0.5) {
        t = m2 + m2;
        m2 = t + t * (m2 / (1.0 - m2));
        if ((m2 > 4.503599627370496E+15) || rtIsNaN(m2)) {
          m2++;
          m2 = std::log(m2);
        } else {
          if (!(m2 < 2.2204460492503131E-16)) {
            m2 = std::log(m2 + 1.0) * (m2 / ((m2 + 1.0) - 1.0));
          }
        }

        m2 /= 2.0;
      } else if (m2 == 1.0) {
        m2 = rtInf;
      } else {
        m2 = (m2 + m2) / (1.0 - m2);
        if ((m2 > 4.503599627370496E+15) || rtIsNaN(m2)) {
          m2++;
          m2 = std::log(m2);
        } else {
          m2 = std::log(m2 + 1.0) * (m2 / ((m2 + 1.0) - 1.0));
        }

        m2 /= 2.0;
      }

      if (negx) {
        m2 = -m2;
      }

      U[k] = m2 * 0.02;
    }

    // U
    // расчет сети
    for (renew = 0; renew < 1000; renew++) {
      // пересчет значений для частей функции оптимизации 
      for (ux = 0; ux < 12; ux++) {
        for (ui = 0; ui < 12; ui++) {
          t = 0.0;
          m2 = 0.0;
          m3 = 0.0;
          m4 = 0.0;

          // первая часть функции оптимизации (в каждой строке 1 
          // город)
          for (j = 0; j < 12; j++) {
            if (j != ui) {
              t += V[ux + 12 * j];
            }

            if (j != ux) {
              m2 += V[j + 12 * ui];
            }

            for (k = 0; k < 12; k++) {
              m3 += V[j + 12 * k];
            }

            if (j != ux) {
              if (ui + 1 == 1) {
                m4 += d[ux + 12 * j] * (V[j + 12] + V[j + 132]);
              } else if (ui + 1 == 12) {
                m4 += d[ux + 12 * j] * (V[j + 120] + V[j]);
              } else {
                m4 += d[ux + 12 * j] * (V[j + 12 * (ui + 1)] + V[j + 12 * (ui -
                  1)]);
              }
            }
          }

          t *= -500.0;

          // вторая часть функции оптимизации (в каждом столбце 1 
          // город)
          m2 *= -500.0;

          // третья часть функции оптимизации (один маршрут) 
          m3 = -1000.0 * (m3 - 12.0);

          // четвертая часть функции оптимизации (минимизация длины 
          // «стоимости»
          // пути)
          m4 *= -500.0;
          k = ux + 12 * ui;
          Udao[k] = (((-U[k] + t) + m2) + m3) + m4;
        }
      }

      // пересчет весов связей
      // расчет выходных значений передаточной функции нейрона 
      for (k = 0; k < 144; k++) {
        m2 = U[k] + 0.0001 * Udao[k];
        U[k] = m2;
        V[k] = (std::tanh(m2 / 0.02) + 1.0) / 2.0;
      }

      // пересчет еще раз выходов нейронов (повторное предъявление) 
      for (ux = 0; ux < 12; ux++) {
        for (ui = 0; ui < 12; ui++) {
          i = ux + 12 * ui;
          m2 = V[i];
          if (V[i] < 0.3) {
            m2 = 0.0;
            V[i] = 0.0;
          }

          if (m2 > 0.7) {
            V[i] = 1.0;
          }
        }
      }
    }

    // вывод промежуточного результата
    // V
    // тестирование, проверка результатов
    // Подсчет общего числа едениц в матрице
    m2 = 0.0;

    // проверка в каждой строке один город
    t = 0.0;

    // проверка в каждом столбце один город
    m3 = 0.0;
    for (ux = 0; ux < 12; ux++) {
      for (ui = 0; ui < 12; ui++) {
        m2 += V[ux + 12 * ui];
      }

      for (ui = 0; ui < 11; ui++) {
        i = 10 - ui;
        for (j = 0; j <= i; j++) {
          k = ui + j;
          t += V[ux + 12 * ui] * V[ux + 12 * (k + 1)];
          m3 += V[ui + 12 * ux] * V[(k + 12 * ux) + 1];
        }
      }
    }

    // проверка всех условий тестирования (проверки) матрицы 
  } while (!((m2 == 12.0) && (t == 0.0) && (m3 == 0.0)));

  for (j = 0; j < 12; j++) {
    for (ui = 0; ui < 12; ui++) {
      if (V[ui + 12 * j] == 1.0) {
        i = order->size[1];
        k = order->size[0] * order->size[1];
        order->size[1]++;
        emxEnsureCapacity_real_T(order, k);
        order->data[i] = static_cast<double>(ui) + 1.0;
      }
    }
  }
}

//
// File trailer for kommi_length_by_dist.cpp
//
// [EOF]
//
