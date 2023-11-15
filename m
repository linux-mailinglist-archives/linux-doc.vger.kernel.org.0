Return-Path: <linux-doc+bounces-1727-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7357A7E1DFE
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 11:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29013281313
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 10:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8021817745;
	Mon,  6 Nov 2023 10:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKKInpNX"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E6A1641B
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 10:12:18 +0000 (UTC)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBD1A9;
	Mon,  6 Nov 2023 02:12:16 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-27d0e3d823fso3076904a91.1;
        Mon, 06 Nov 2023 02:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699265536; x=1699870336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x1Eb4CFcG9LyCXZVja0bLT9/YYKGtme9c2NcHNtTLNM=;
        b=eKKInpNXxLwSyptDiXeoA/d8lG8Azlbe5DrFpoZ9K6zxOfqW3UHYicAdaOxyJ/0aHF
         447coNvlRk9WIm2fPdAHOj+cud5ta55uV01yrVbdk/t/KErJd21xBtyU2OPyY10ozEDl
         4kXorvhYiWtwqBda6rZ6n10DL8yiMeS/YJxrwAPkfemJTlhzVOszLylV37fZgXjjj+uf
         jTxj9B1kNiRxe/ds7k86yBluq653cinkSSFOcGlbufZ30GMu48XJzoNgBrfNR8Ex/oLx
         4qQMBGl7hwbMCGlV/mw7SiD5UF4KOzcNDdG77mLPQbnn2FGlgs+BSXp6E9pNw/JOc3gx
         aodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699265536; x=1699870336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1Eb4CFcG9LyCXZVja0bLT9/YYKGtme9c2NcHNtTLNM=;
        b=uMbIy6qy4hBtpYf/AhjjH42WqsYk12zPMbAxcPR6qqdYG1HfuklvEqQbIZo6P+da/O
         +jotlmPAjlV2Wr3IKnrb0g5lFxfE8PEBCXKRyK0qUla7R1GOWCWubEJa5heULgm87DB1
         +Rf1xrGJTVO/1ujWr1o2Yal28n5thxkMFEyxdT6lUDN0viINU1yHiIFcB8xIRAuJa5oo
         4YnDNGb/IeW2I5Teu5eRVoGv0Y261BuESxZ/HzS/moKUD+/G7LQKZFu0HRE/gIv32w+P
         NQlW0Oiq1ELdGtQlq487V0iQAy3Id7MUrN+jTH+LrqTT5AZPUWAx0rJ8bV6XABWcTNYy
         F4Rw==
X-Gm-Message-State: AOJu0Yx5TtPkZLbFE5teZ1n4BFtau7ZtFAmGW3ebmMXbp842sXl1qOuX
	qSIafP2WrViAHmeawVBqohY=
X-Google-Smtp-Source: AGHT+IGQNoiUnCfGjwXdUlWxqAYwmat1U+sqsjF+Nc2gZDze+QwGS+PwdOrP16gUFZmz3dxfk1wK4w==
X-Received: by 2002:a17:90a:357:b0:27c:f9e7:30fd with SMTP id 23-20020a17090a035700b0027cf9e730fdmr21616849pjf.7.1699265536275;
        Mon, 06 Nov 2023 02:12:16 -0800 (PST)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id 15-20020a17090a190f00b002802d9d4e96sm5759055pjg.54.2023.11.06.02.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 02:12:15 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 5F6A0804FE06; Mon,  6 Nov 2023 17:12:09 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ross Philipson <ross.philipson@oracle.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 0/2] Documentation: x86: Note fixes for boot protocol doc
Date: Mon,  6 Nov 2023 17:12:03 +0700
Message-ID: <20231106101206.76487-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=772; i=bagasdotme@gmail.com; h=from:subject; bh=rnVwujkPbkHdRjBXslxesHNo1pmoL6QtY0YCVjOyzbQ=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDKkeu1sfLTi+fIFS6M9Vy56dKO3+ErZe47DJ5b0K6n37V 97f0GMf0FHKwiDGxSArpsgyKZGv6fQuI5EL7WsdYeawMoEMYeDiFICJ9Acy/OG+85lfa9bTiI2L HG6vYOrelsPYyHhv/sJFLpu7Wa+z/yhn+J8wvz/wK9fbGe92f03cvJLLpSnnu+Jt9+oUM0GBe// LI9gA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

When I was reviewing generated html output of my web font series [1]
by viewing boot protocol doc (Documentation/output/arch/x86/boot.html),
I noticed that notes there wasn't right: the first note extended to
the end of doc; and the last one wasn't marked up as note either.

Let's fix them up.

[1]: https://lore.kernel.org/lkml/20231102120053.30630-1-bagasdotme@gmail.com/

Bagas Sanjaya (2):
  Documentation: x86: Indent note directive for protocol version number
    note
  Documentation: x86: Wrap EFI handover deprecation in note block

 Documentation/arch/x86/boot.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)


base-commit: 77fa2fbe87fc605c4bfa87dff87be9bfded0e9a3
-- 
An old man doll... just what I always wanted! - Clara


