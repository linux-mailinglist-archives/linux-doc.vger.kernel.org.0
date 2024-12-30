Return-Path: <linux-doc+bounces-33762-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D86E09FEB67
	for <lists+linux-doc@lfdr.de>; Mon, 30 Dec 2024 23:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D185D188327C
	for <lists+linux-doc@lfdr.de>; Mon, 30 Dec 2024 22:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884801B041B;
	Mon, 30 Dec 2024 22:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wLShl572"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B41B1AA1F6
	for <linux-doc@vger.kernel.org>; Mon, 30 Dec 2024 22:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735597839; cv=none; b=rrIP+aesWFt3YmtT1E4DMXmHyQwnY72C4FeMs+CatCPWW/DBnSxNDwdPoZdg546mdkxwaM0Qo9vX9c1rsJu2M+i0jZEwtnWKjf/20/MfMWXuaYAYr6AJFm4H7Ni6hqt2RwdxMxBU4BUB0RYPjm+QYWMVVFQtKA/e3MWkBESvCHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735597839; c=relaxed/simple;
	bh=XKLtg6hasoIGAI7uNbbTgs8kYTxARwPlbSF6Jrbr4s0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GTQUwMQYNSBRM3evDSHOixLmkLgnicBnFn9r2pb5NaXKUKTGJQaUgMXbr2J9JqrxC0MU3bf/szIocU5LnhomZRlFGjJh7KYsm83by6fJzibXJsHoI/FIVjmnfq0Gc8hZoRwFcOmfyaZfcHPZkxWTLgiUKvINtFAi3N6VW018wok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wLShl572; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2efa0eb9dacso13006073a91.1
        for <linux-doc@vger.kernel.org>; Mon, 30 Dec 2024 14:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735597837; x=1736202637; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj7WTgvEC5PveVDeiSHDuXxxtWMFpPRYSD2aMV1KZG0=;
        b=wLShl572YkeuA5fZGkjJqkpM7xziLF2hODFbzet1Yj/nLXUeHdi3d0ANtzSl3bbyCk
         /zdzc6+TIrq+8aURasIPqLnoohGx34q7ahWTmNWMg4jUs0/UdNWPdy7PXra+gqGzHsjV
         nvxk+pKYUuuFWeYRL9tLns3JZAlk35S4saYvKwuEY9eXHOPhiOrQtcstoK2/g3GKphQr
         pwg6su2bns3++L2NlJJHNBYbo22xVkUlI9r7x2YCpxqSIReu6QB6FlIBnhpm/j4XpRw1
         XUL8LYvr//F9PvhwsvxOPEoJnEZb1WhAT8Ga80ooUUwn8aa+ZWd1rH9MoIq7hrSa93OS
         3llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735597837; x=1736202637;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj7WTgvEC5PveVDeiSHDuXxxtWMFpPRYSD2aMV1KZG0=;
        b=Cifi/FR8aaLPfDp5p7aNcCX6zY/oIdfcBvsG8H6klDoSXB9pRVSP3amTfOL/q3yBxc
         VzXadZAxx3zQZYBKM7gqRluygMCI7H57EjQ+P1JpD/oa57kslMG1Ywl37Hvl6IKgZAJw
         IbRFC6b0S8eEq51z/AgH7zE+si00GR8nTSnM+Yiw5f+eshtSbj9PddByLmNysduoFfr6
         G3DWKCB+D5JsepohLe4+dAB267rMPCdpZRoNHf2pwEH0CcMx+L18f1f/4Q5XYC6hgalj
         K+GRPad1CeJBKEY1iqtgLhKcb37NIl2VCb+l8koVpyxO9tPTNgjNImqJ0Dex6HbPOdOf
         T7ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWvr/bj1MH9Ai/1p0/TsaPWQOvFdLjfgbh3jx6Rr6lDk2ib0XHuQhtmp24992gK+gtPm7LWogpRxp8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2+mEtysFsMpssqdr71hHgjjSOUdC3gPjNXtm36k/hD/+yX9oL
	qCHALqWqv0kMmAqsBaHYWjA/Jd2bHKVMG3lEBRWnZfZYGT6dm3CioUqWQQtXuMbPZDdKMiM43px
	kV20NfQ==
X-Google-Smtp-Source: AGHT+IH7lc1nyh322CeIPNFTmhSrY+WwroJDc14f4njjj+YFTtVUIi6WYQ2iNzBtq2Ci0HPEKUE6eWlngS24
X-Received: from pjtu11.prod.google.com ([2002:a17:90a:c88b:b0:2f2:e933:8ba6])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d09:b0:2ea:61de:38f7
 with SMTP id 98e67ed59e1d1-2f452ee6340mr56277909a91.29.1735597836920; Mon, 30
 Dec 2024 14:30:36 -0800 (PST)
Date: Mon, 30 Dec 2024 22:30:31 +0000
In-Reply-To: <20241230-extended-modversions-v12-0-296a6a0f5151@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241230-extended-modversions-v12-0-296a6a0f5151@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241230-extended-modversions-v12-4-296a6a0f5151@google.com>
Subject: [PATCH v12 4/5] Documentation/kbuild: Document storage of symbol information
From: Matthew Maurer <mmaurer@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Document where exported and imported symbols are kept, format options,
and limitations.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 Documentation/kbuild/modules.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index 101de236cd0c9abe1f5684d80063ff3f9a7fc673..a42f00d8cb90ff6ee44677c1278287ef25a84c89 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -423,6 +423,26 @@ Symbols From the Kernel (vmlinux + modules)
 	1) It lists all exported symbols from vmlinux and all modules.
 	2) It lists the CRC if CONFIG_MODVERSIONS is enabled.
 
+Version Information Formats
+---------------------------
+
+	Exported symbols have information stored in __ksymtab or __ksymtab_gpl
+	sections. Symbol names and namespaces are stored in __ksymtab_strings,
+	using a format similar to the string table used for ELF. If
+	CONFIG_MODVERSIONS is enabled, the CRCs corresponding to exported
+	symbols will be added to the __kcrctab or __kcrctab_gpl.
+
+	If CONFIG_BASIC_MODVERSIONS is enabled (default with
+	CONFIG_MODVERSIONS), imported symbols will have their symbol name and
+	CRC stored in the __versions section of the importing module. This
+	mode only supports symbols of length up to 64 bytes.
+
+	If CONFIG_EXTENDED_MODVERSIONS is enabled (required to enable both
+	CONFIG_MODVERSIONS and CONFIG_RUST at the same time), imported symbols
+	will have their symbol name recorded in the __version_ext_names
+	section as a series of concatenated, null-terminated strings. CRCs for
+	these symbols will be recorded in the __version_ext_crcs section.
+
 Symbols and External Modules
 ----------------------------
 

-- 
2.47.1.613.gc27f4b7a9f-goog


