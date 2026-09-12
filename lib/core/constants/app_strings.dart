class AppStrings {
  static const String appName = 'Acompanhamento da Obra';
  static const String appShortName = 'Obra';
  static const String mainTitle = '🏗️ Checklist Interativo de Acompanhamento de Obra';
  static const String mainSubtitle = 'Acompanhe o status e a evolução da sua obra etapa por etapa.';

  static const String progressTitle = 'Progresso Geral da Obra';
  static const String stagesCompleted = 'etapas concluídas';
  static const String stagesPending = 'etapas pendentes';

  static const String resetButton = '🔄 Reiniciar obra';
  static const String resetConfirmTitle = 'Reiniciar acompanhamento?';
  static const String resetConfirmMessage = 'Tem certeza que deseja reiniciar o acompanhamento? Todas as etapas voltarão para pendente.';
  static const String cancel = 'Cancelar';
  static const String confirm = 'Reiniciar';

  static const String completionTitle = '🎉 Obra 100% concluída!';
  static const String completionMessage = 'Parabéns! Todas as etapas do acompanhamento da obra foram concluídas com sucesso.';

  static const String aboutTitle = 'Sobre o App';
  static const String aboutDescription = 'Aplicativo para acompanhamento e controle das etapas de uma obra através de checklist e indicadores de progresso.';
  static const String version = '1.0.0';

  static const List<Map<String, dynamic>> checklistData = [
    {
      'phase': 'Fase 1: Planejamento & Documentação',
      'stages': [
        {'id': 'p1_1', 'name': 'Terreno e Lote'},
        {'id': 'p1_2', 'name': 'Liberação na Prefeitura'},
        {'id': 'p1_3', 'name': 'Liberação Ambiental'},
        {'id': 'p1_4', 'name': 'Liberação no Sindicato'},
        {'id': 'p1_5', 'name': 'Início da Obra'},
      ],
    },
    {
      'phase': 'Fase 2: Serviços Preliminares & Preparação',
      'stages': [
        {'id': 'p2_1', 'name': 'Supressão Vegetal'},
        {'id': 'p2_2', 'name': 'Fechamento do Lote & Áreas Provisórias'},
        {'id': 'p2_3', 'name': 'Terraplenagem'},
        {'id': 'p2_4', 'name': 'Drenagem'},
        {'id': 'p2_5', 'name': 'Marcação da Obra (Gabarito)'},
      ],
    },
    {
      'phase': 'Fase 3: Estrutura & Vedações',
      'stages': [
        {'id': 'p3_1', 'name': 'Infraestrutura / Fundações'},
        {'id': 'p3_2', 'name': 'Superestrutura / Pavimentos'},
        {'id': 'p3_3', 'name': 'Vedação (Alvenaria)'},
      ],
    },
    {
      'phase': 'Fase 4: Cobertura & Instalações',
      'stages': [
        {'id': 'p4_1', 'name': 'Instalações Elétricas'},
        {'id': 'p4_2', 'name': 'Instalações Hidráulicas'},
        {'id': 'p4_3', 'name': 'Instalações de Telecomunicações & Segurança'},
        {'id': 'p4_4', 'name': 'Reboco / Emboço'},
        {'id': 'p4_5', 'name': 'Cobertura, Telhado, Rufos e Calhas'},
      ],
    },
    {
      'phase': 'Fase 5: Acabamentos',
      'stages': [
        {'id': 'p5_1', 'name': 'Revestimentos Cerâmicos'},
        {'id': 'p5_2', 'name': 'Aberturas e Esquadrias'},
        {'id': 'p5_3', 'name': 'Pintura e Finalização'},
        {'id': 'p5_4', 'name': 'Limpeza Final'},
        {'id': 'p5_5', 'name': 'Entrega de Chaves'},
      ],
    },
  ];
}
