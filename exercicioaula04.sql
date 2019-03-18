--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `id_cidade` int(11) NOT NULL,
  `cidade` varchar(90) NOT NULL,
  `uf` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`id_cidade`, `cidade`, `uf`) VALUES
(1, 'Iguatemi', 'MS'),
(2, 'Maringa', 'PR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(90) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `id_endereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `cpf`, `id_endereco`) VALUES
(1, 'Ana Carolina', '4098764598', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `rua` varchar(90) NOT NULL,
  `numero` int(11) NOT NULL,
  `complemento` varchar(50) NOT NULL,
  `cep` varchar(90) NOT NULL,
  `id_cidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id_endereco`, `rua`, `numero`, `complemento`, `cep`, `id_cidade`) VALUES
(2, 'Rua Teste A', 1734, 'Casa', '79960000', 1),
(3, 'Rua Teste B', 1703, 'Apartamento ', '87010370', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `recibo`
--

CREATE TABLE `recibo` (
  `id_recibo` int(11) NOT NULL,
  `sequencia` int(11) NOT NULL,
  `valor` double NOT NULL,
  `data` date NOT NULL,
  `assinatura` varchar(90) NOT NULL,
  `referente` varchar(90) NOT NULL,
  `id_cidade` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(90) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `login` varchar(90) NOT NULL,
  `senha` varchar(90) NOT NULL,
  `id_endereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id_cidade`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_edereco_fk` (`id_endereco`);

--
-- Indexes for table `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `id_cidade_fk` (`id_cidade`);

--
-- Indexes for table `recibo`
--
ALTER TABLE `recibo`
  ADD PRIMARY KEY (`id_recibo`),
  ADD KEY `id_cidade_fk` (`id_cidade`),
  ADD KEY `id_usuario_fk` (`id_usuario`),
  ADD KEY `id_cliente_fk` (`id_cliente`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_endereco_fk` (`id_endereco`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cidade`
--
ALTER TABLE `cidade`
  MODIFY `id_cidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recibo`
--
ALTER TABLE `recibo`
  MODIFY `id_recibo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `id_endereco_fk` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `id_cidade_fk` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id_cidade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `recibo`
--
ALTER TABLE `recibo`
  ADD CONSTRAINT `cidade_id_fk` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id_cidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cliente_id_fk` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id_cidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario_id_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `endereco_id_fk` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;
