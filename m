Return-Path: <linux-doc+bounces-31495-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B700C9D674E
	for <lists+linux-doc@lfdr.de>; Sat, 23 Nov 2024 03:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48474B21C3B
	for <lists+linux-doc@lfdr.de>; Sat, 23 Nov 2024 02:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECFE126C13;
	Sat, 23 Nov 2024 02:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Se1142Ld"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F182E178383
	for <linux-doc@vger.kernel.org>; Sat, 23 Nov 2024 02:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732329747; cv=none; b=Ats650feeI9mrEls5kw6EVlF7Hd2X3bj/+pznrHyMJGajPWHpSt8/m33mOq70+IFopZulFMoP86+f4Vxg2dB7EPkq5G45l7itb4W77ZzVhmYGynfzLmsSKsKoMxfCQi/I86rVtpCYvTpb8HUAosMJbN34A1fTQAavQ5M8cfedIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732329747; c=relaxed/simple;
	bh=C2iRNRCBIbNngHVZfY3T3X2W51MTV200R2LoLraROFM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uMgkz8iR0H8i92yj4YsOh58EdJTL2ui+HgILpteFcazwYiRFLyp8X69O5WfXKrIjwzkmEDiyjeLtmAqtw8S20XX7KaNje13KjVzhVDDJLuSuvuW+R3ic0/QVQvXtIwLl5xZ0FcfOLbgCVN02W8tuaW66uVQDueIFjXPSnya4lr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Se1142Ld; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ee57ae0f61so46092677b3.0
        for <linux-doc@vger.kernel.org>; Fri, 22 Nov 2024 18:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732329744; x=1732934544; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kii4UoP5f1YtphOdoxMErS859kUztR72G7iPiVSrt7I=;
        b=Se1142LdPRwWorcAjCE4jKISf4oVIoqHSFrAeI9qXs+iQptUWwxEtlZ+Z75GHOyurF
         VheeGTHDMzRdVGBvrkpMg0gbW46jU3YX+dDlqu3Tvs0wsB1t1gVc/Nd5kEPDpqucqiTh
         xdys6qAbrnaPHQ34OAXDaDlM3tT1LA5XQUOR3vzXKpdo419gASi9GVtjgmKS0Yk2TK0u
         ihDr5KgXEZpXbJI/MCn664gvIjHyEbEaypnmbi8buG2qKrC9+1fWrR+B3mufjhTiCR14
         lov5swBhcmCEqXwWnqxkioCuSCjN3mP2/4InGf9gLwhNgOxF91m95hq591oztV/JDN9C
         QZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732329744; x=1732934544;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kii4UoP5f1YtphOdoxMErS859kUztR72G7iPiVSrt7I=;
        b=M0H0dcCTTMZARszoM3RbKdW+yCYaWS8h12qGo8ootCDQ509TA8M0y4F/ikL4yDyjxS
         2lShkZ9MuownNVZrPqvdTHWXwLhi/+uGrUaTbZrOfK2Z0aqxqOzmTVV2Sto/fjuPC/Vm
         lhjMfnq8rxWAsgMYHje1c9pMFGgxW3misgtr7Sg4Oy78xehc/X/ouuwOwGgCrLRoEXJo
         yVJo9f2wnzdkwuFvUkci8aDVWJTN61mV7oylgNRLT4QlohzAnBBpxr2L7bXX2C0G03xU
         r6Ds6+yVQe3UIFh0Xm5YNQZNJCe+IeXuEMArhLuXcsEh0opZUM9gydxFTeQ6eZoM/MmC
         Srqg==
X-Forwarded-Encrypted: i=1; AJvYcCVZYgJfKf5Q2g1cPtExwDf5d4f9+RSuTgmowup40zxNwQPRKc4ucevzUi7FsqdgRJrMgrdOjZPFWCc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9bC/RF30hFTYHCoPGoSub+Kr8W3R/gh2GFyP2Xqe4hmyV6A8u
	Ppk6vsyhGbnZk2iAvW7cWIS6n28WvJ30JBl5QTCeQ3OCrcKzdEEmOs4DNpU9LdsbAEpka6DEgQn
	H7Fcw+g==
X-Google-Smtp-Source: AGHT+IG+H4NW7tyyIrvwq7W3DAn+ppP0DFvvL1CqE8PbvAp+Z5WdI4+9TjnoY/n2Aojqm2QXy8sSu+gLuVEg
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:988:b0:6e2:1b8c:39bf with SMTP id
 00721157ae682-6eee0874b31mr48797b3.2.1732329743988; Fri, 22 Nov 2024 18:42:23
 -0800 (PST)
Date: Sat, 23 Nov 2024 02:42:18 +0000
In-Reply-To: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241123-extended-modversions-v10-4-0fa754ffdee3@google.com>
Subject: [PATCH v10 4/5] Documentation/kbuild: Document storage of symbol information
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
index 101de236cd0c9abe1f5684d80063ff3f9a7fc673..c32e3ed67cd26070f6929f6ad98c4308a1ab71f8 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -423,6 +423,26 @@ Symbols From the Kernel (vmlinux + modules)
 	1) It lists all exported symbols from vmlinux and all modules.
 	2) It lists the CRC if CONFIG_MODVERSIONS is enabled.
 
+Version Information Formats
+---------------------------
+
+	Exported symbols have information stored in __ksymtab or __ksymtab_gpl
+	sections. Symbol names and namespaces are stored in __kstrtab and
+	__kstrtabns respectively, using a format similar to the string table
+	used for ELF. If CONFIG_MODVERSIONS is enabled, the CRCs corresponding
+	to exported symbols will be added to the __kcrctab or __kcrctab_gpl.
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
2.47.0.371.ga323438b13-goog


