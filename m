Return-Path: <linux-doc+bounces-73701-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPYoI/FpcmnckQAAu9opvQ
	(envelope-from <linux-doc+bounces-73701-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 22 Jan 2026 19:18:25 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 428836C359
	for <lists+linux-doc@lfdr.de>; Thu, 22 Jan 2026 19:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 26EEE301506C
	for <lists+linux-doc@lfdr.de>; Thu, 22 Jan 2026 17:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0816237D13E;
	Thu, 22 Jan 2026 17:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="c07CYpp9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F693994D7
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 17:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769102773; cv=none; b=KTavvOmp2PZtacM2uJ8YCVtteCbogBWLjyaEFgZ269xcJv4U/25qzuierZ8NVHbHJGza+FUtb+VrtNe0GMt/ioCFpq3FhB2W8HXFCI+N2DriTOfMkcJvMDWw94wFTgnJNocExQrj2Z0jCVq/lzWFYx6YGq2vhUfIVQtkmR8t9E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769102773; c=relaxed/simple;
	bh=4c4AiA3SasUHskPLpbLeO+7FAYD01Nd/2APubavnDAM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YPS8xJjU6sJnqsFlYM7ZCNaPVLA57lf11NB+epx0jM4oQOlc93+3JpkwnGzkGjxwjzbTNT9C/XszAMZIt3mysWQcQyuQc3uzGtD46C7sdNTQhZQyr0YkW4hBjLOT6u6eZThW1pYHDxJe4dIl/tDbaShKkdH3d3tktvRW8lSiAZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=c07CYpp9; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1769102758; x=1769361958;
	bh=nyjwh9Rs5YqQ4WtOoe0Vcb06dokpFc8gAXu8v/qQW98=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=c07CYpp94NIFyoXpn3kW9d+lErgFdARNLb9OXtFOY1xHVNUtO7s3LxdFbP+VmxIwN
	 J3xDvdtLWKso2Ppg10yfLSpRmxdPN8CGBQGjy66nDxsX/h3f6GcDr7pM9ShGxq7ha1
	 jF+1ZdUU55T3hRuUQ5ucsMij53ElLsCsnczXZ1XaHT8k3KDhv5+xb4R7Lm58ur66SF
	 XuWrbsA+/nxs3fbevZmb2XAZDUCdcZ/ZOZE1/oorhRILXjctvWsbl7cfQcr55Im579
	 d4DcjWuqxA2BMJF/DR53xWca4z3MKA+FsanD1Opn7NiWHtGxokkUjtJJDSPCvHglpS
	 g5QJpjK/7AiWw==
Date: Thu, 22 Jan 2026 17:25:48 +0000
To: Andrew Morton <akpm@linux-foundation.org>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Borislav Petkov <bp@alien8.de>, corbet@lwn.net, morbo@google.com, rppt@kernel.org, lorenzo.stoakes@oracle.com, ubizjak@gmail.com, mingo@redhat.com, vincenzo.frascino@arm.com, maciej.wieczor-retman@intel.com, maz@kernel.org, catalin.marinas@arm.com, yeoreum.yun@arm.com, will@kernel.org, jackmanb@google.com, samuel.holland@sifive.com, glider@google.com, osandov@fb.com, nsc@kernel.org, luto@kernel.org, jpoimboe@kernel.org, Liam.Howlett@oracle.com, kees@kernel.org, jan.kiszka@siemens.com, thomas.lendacky@amd.com, jeremy.linton@arm.com, dvyukov@google.com, axelrasmussen@google.com, leitao@debian.org, ryabinin.a.a@gmail.com, bigeasy@linutronix.de, peterz@infradead.org, mark.rutland@arm.com, urezki@gmail.com, brgerst@gmail.com, hpa@zytor.com, mhocko@suse.com, andreyknvl@gmail.com, weixugc@google.com, kbingham@kernel.org, vbabka@suse.cz, nathan@kernel.org, trintaeoitogc@gmail.com, samitolvanen@google.com, tglx@kernel.org, thuth@redhat.com, surenb@google.com, anshuman.khandual@arm.com,
	smostafa@google.com, yuanchu@google.com, ada.coupriediaz@arm.com, dave.hansen@linux.intel.com, kas@kernel.org, nick.desaulniers+lkml@gmail.com, david@kernel.org, ardb@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v8 00/14] kasan: x86: arm64: KASAN tag-based mode for x86
Message-ID: <aXJcoHSRLY7tzIpU@wieczorr-mobl1.localdomain>
In-Reply-To: <20260113093400.412cb4c5596ff3336ac803fb@linux-foundation.org>
References: <cover.1768233085.git.m.wieczorretman@pm.me> <20260112102957.359c8de904b11dc23cffd575@linux-foundation.org> <20260113114705.GJaWYwubl3yCqa1POx@fat_crate.local> <20260113093400.412cb4c5596ff3336ac803fb@linux-foundation.org>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 460f3c13defaa3d7589248b966d5fcef4b3ce730
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[alien8.de,lwn.net,google.com,kernel.org,oracle.com,gmail.com,redhat.com,arm.com,intel.com,sifive.com,fb.com,siemens.com,amd.com,debian.org,linutronix.de,infradead.org,zytor.com,suse.com,suse.cz,linux.intel.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-73701-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[65];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.wieczorretman@pm.me,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	NEURAL_HAM(-0.00)[-0.975];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wieczorr-mobl1.localdomain:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,alien8.de:email,pm.me:dkim]
X-Rspamd-Queue-Id: 428836C359
X-Rspamd-Action: no action

On 2026-01-13 at 09:34:00 -0800, Andrew Morton wrote:
>On Tue, 13 Jan 2026 12:47:05 +0100 Borislav Petkov <bp@alien8.de> wrote:
>
>> On Mon, Jan 12, 2026 at 10:29:57AM -0800, Andrew Morton wrote:
>> > The review process seems to be proceeding OK so I'll add this to
>> > mm.git's mm-new branch, which is not included in linux-next.  I'll aim
>> > to hold it there for a week while people check the patches over and
>> > send out their acks (please).  Then I hope I can move it into mm.git's
>> > mm-unstable branch where it will receive linux-next exposure.
>>=20
>> Yah, you can drop this one and take the next revision after all comments=
 have
>> been addressed.
>
>Cool, I removed the series.

I sent v9 with (I hope) all comments addressed:
https://lore.kernel.org/all/cover.1768845098.git.m.wieczorretman@pm.me/

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman


