Return-Path: <linux-doc+bounces-94333-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qdArEqT2RGp74AoAu9opvQ
	(envelope-from <linux-doc+bounces-94333-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 13:14:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA83E6ECA24
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 13:14:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94333-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94333-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79979305875D
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 11:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC158426EC0;
	Wed,  1 Jul 2026 11:13:07 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BC63B6356;
	Wed,  1 Jul 2026 11:13:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904387; cv=none; b=PQ2KJAh8EGm+lDlJoyOOUuo1pHFzv+0/b6Jh9QRxp90uiIFwyCM86eOAFb8mlX6M9N1oLbV4Tj8CR45Wngtkdc564R833HqtZ/zEiTQ0Xc1ZpfZI1/D9l6sWh+F/ONU3lzNnLIM3aVWki6PRx98QRenTwpkKCLuTmletaTero4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904387; c=relaxed/simple;
	bh=lmqv6nwOMIQ1/A6MU3tdd/l8iraWfFOg4UXcDmZWx3Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Tba9GsrutolAMYiyhx1zdpjFS9uxZyv1y4rYtqyKsfFGB/9VC/XODoiX9dxmnd6d/6SYN/s5xlO8F+KvLx2AHzoboocOfBHkwJId8HTEPuE06M5i17I+8lX7wcRoWMGn46vxNxjE318vnudf2sR+lrfT3C7Tld7rKTMcssOg8RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=212.18.0.10
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gqxxr4nzTz1sHPn;
	Wed,  1 Jul 2026 13:05:20 +0200 (CEST)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gqxxq4lg4z1sHPX;
	Wed,  1 Jul 2026 13:05:19 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4gqxxp59v1z1qqlT;
	Wed,  1 Jul 2026 13:05:18 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id tQZ9_tKXpaIT; Wed,  1 Jul 2026 13:05:09 +0200 (CEST)
X-Auth-Info: Pt4uSQGEyIjPFT3BPFolkb81GA8tMoI4Th+4yeNg3MiwksamljRMriYVf7/YBrTR
Received: from hawking (unknown [80.255.5.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed,  1 Jul 2026 13:05:09 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,  Deepak Gupta via B4 Relay
 <devnull+debug.rivosinc.com@kernel.org>,  Thomas Gleixner
 <tglx@linutronix.de>,  Ingo Molnar <mingo@redhat.com>,  Borislav Petkov
 <bp@alien8.de>,  Dave Hansen <dave.hansen@linux.intel.com>,
  x86@kernel.org,  "H. Peter Anvin" <hpa@zytor.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  "Liam R. Howlett" <Liam.Howlett@oracle.com>,
  Vlastimil Babka <vbabka@suse.cz>,  Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Conor Dooley <conor@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,
  Christian Brauner <brauner@kernel.org>,  Peter Zijlstra
 <peterz@infradead.org>,  Oleg Nesterov <oleg@redhat.com>,  Kees Cook
 <kees@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <shuah@kernel.org>,  Jann Horn <jannh@google.com>,  Conor Dooley
 <conor+dt@kernel.org>,  Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor
 <alex.gaynor@gmail.com>,  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  Andreas
 Hindborg <a.hindborg@kernel.org>,  Alice Ryhl <aliceryhl@google.com>,
  Trevor Gross <tmgross@umich.edu>,  Benno Lossin <lossin@kernel.org>,
  linux-kernel@vger.kernel.org,  linux-fsdevel@vger.kernel.org,
  linux-mm@kvack.org,  linux-riscv@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arch@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  alistair.francis@wdc.com,  richard.henderson@linaro.org,
  jim.shu@sifive.com,  andybnac@gmail.com,  kito.cheng@sifive.com,
  charlie@rivosinc.com,  atishp@rivosinc.com,  evan@rivosinc.com,
  cleger@rivosinc.com,  alexghiti@rivosinc.com,  samitolvanen@google.com,
  broonie@kernel.org,  rick.p.edgecombe@intel.com,
  rust-for-linux@vger.kernel.org,  Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v23 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ
 | VM_WRITE
In-Reply-To: <CAKC1njRapOxS6ibQdCuES1E3aAjsA+yGz4yZ1xJAZHU2vkAm_A@mail.gmail.com>
	(Deepak Gupta's message of "Tue, 2 Jun 2026 09:19:50 -0700")
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
	<20251112-v5_user_cfi_series-v23-6-b55691eacf4f@rivosinc.com>
	<87jyslndo4.fsf@igel.home>
	<CAKC1njS=AHu6uHrH4ae8VxcdEbhgiPXYCAoN3F_mnppBd3SwOA@mail.gmail.com>
	<875x44o9hj.fsf@igel.home>
	<CAKC1njSn_rtCj8ii876PNQTk0nsCTfWsb4DzdymufHVthh1Rkg@mail.gmail.com>
	<871peqgp9v.fsf@igel.home>
	<CAKC1njR+dTdvp+BmLGPtgd8dufiUwBtkQ9a-qinELT_Fmi13sQ@mail.gmail.com>
	<87wlwif04z.fsf@igel.home>
	<87tsrli6lt.fsf@email.froward.int.ebiederm.org>
	<CAKC1njRapOxS6ibQdCuES1E3aAjsA+yGz4yZ1xJAZHU2vkAm_A@mail.gmail.com>
Date: Wed, 01 Jul 2026 13:05:09 +0200
Message-ID: <mvm8q7vt1ga.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:debug@rivosinc.com,m:ebiederm@xmission.com,m:devnull+debug.rivosinc.com@kernel.org,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:lorenzo.stoakes@oracle.com,m:paul.walmsley@sifive.com,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:conor@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:arnd@arndb.de,m:brauner@kernel.org,m:peterz@infradead.org,m:oleg@redhat.com,m:kees@kernel.org,m:corbet@lwn.net,m:shuah@kernel.org,m:jannh@google.com,m:conor+dt@kernel.org,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:lossin@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-riscv@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arch@vger.ker
 nel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:alistair.francis@wdc.com,m:richard.henderson@linaro.org,m:jim.shu@sifive.com,m:andybnac@gmail.com,m:kito.cheng@sifive.com,m:charlie@rivosinc.com,m:atishp@rivosinc.com,m:evan@rivosinc.com,m:cleger@rivosinc.com,m:alexghiti@rivosinc.com,m:samitolvanen@google.com,m:broonie@kernel.org,m:rick.p.edgecombe@intel.com,m:rust-for-linux@vger.kernel.org,m:zong.li@sifive.com,m:devnull@kernel.org,m:krzk@kernel.org,m:alexgaynor@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94333-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER(0.00)[schwab@linux-m68k.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[xmission.com,kernel.org,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,oracle.com,suse.cz,sifive.com,dabbelt.com,eecs.berkeley.edu,arndb.de,infradead.org,lwn.net,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,kvack.org,lists.infradead.org,wdc.com,linaro.org,rivosinc.com,intel.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[schwab@linux-m68k.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_GT_50(0.00)[60];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,debug.rivosinc.com,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA83E6ECA24

Any news? This is still broken in 7.2-rc1.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

