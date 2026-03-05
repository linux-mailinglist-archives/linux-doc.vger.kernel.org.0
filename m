Return-Path: <linux-doc+bounces-78081-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKI+BuD0qWmcIgEAu9opvQ
	(envelope-from <linux-doc+bounces-78081-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Mar 2026 22:25:52 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AC28E2187D6
	for <lists+linux-doc@lfdr.de>; Thu, 05 Mar 2026 22:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC7C43023D7C
	for <lists+linux-doc@lfdr.de>; Thu,  5 Mar 2026 21:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976E535DA66;
	Thu,  5 Mar 2026 21:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="D/mneLLF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B03221726;
	Thu,  5 Mar 2026 21:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772745949; cv=none; b=sLwmGGoXCqBvoG//iHntF5tg7YwiY/JcD8S6xPa71F6UT0QEI4WRpdrMATBpwy+Mp+K1ugv0XychcM7HL0/Iz6vDmWT4E52pSbTrWX/oAkDYl5Shfg7hNQDpCtBMBoY/NPGILGax6o2A4KurK1hB2uBxcXLZN9v7G0rXyaDYosw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772745949; c=relaxed/simple;
	bh=TPF/Q7ncQZcbDUXuzcqWPm9P90x5P/esUaASP+y1v2o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UGIIJuqzzuw4c+fOec+uicA3jzQyJauMCtmvbIr4diQUYXr9wlLOI+ym/9gPMWf8VF3vlkytr4RJPUQX/g9k+8ynjyArxR8VQxBlrnhPolwLUVrv0SCpxkL7RHVEkOOfIwBgHkZMPxLqvAz7E3UyHiEQWcdtZoGkZaib/eb/+1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=D/mneLLF; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1772745931; x=1773005131;
	bh=TPF/Q7ncQZcbDUXuzcqWPm9P90x5P/esUaASP+y1v2o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=D/mneLLFVs6r0IvF+iCRfj60Ah/EZZuLEfnUlva1LdL5DC82Vz9Qw/VqefhhANJWp
	 WDyIrKxz8tdw1gjxkMNCbBDQaV2m8g70kPhDvDgqzjq10LWdXthhW3sqaOhboAVimN
	 fx+5VJ1BndeTf8PTDE7XZ5c1QF09c544w9woMA5NGpZE1sAIC1ejlnCTGEAy+GkzoO
	 Np3S48Ku9tVqsimRsmAltXy1/WyBD31pdq4wHYtO5HTpRIAD/yUzeNKjaEYjiGM7A1
	 xRIXcWjq7VefAOsjRln3WzSuL5V/BJC8LgLU2T1zJl/RE4F5LnsI4Q9CZOfSXLfeSb
	 guSupu87mt2BA==
Date: Thu, 05 Mar 2026 21:25:26 +0000
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Samuel Holland <samuel.holland@sifive.com>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, workflows@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH v10 01/13] kasan: sw_tags: Use arithmetic shift for shadow computation
Message-ID: <aan0qbP0iV48bih-@wieczorr-mobl1.localdomain>
In-Reply-To: <CAPAsAGyiukChPLYO_tQci-7Bvmnnxh+w=bO6eUYLrO3RVuUThw@mail.gmail.com>
References: <cover.1770232424.git.m.wieczorretman@pm.me> <bd935d83b2fe3ddfedff052323a2b84e85061042.1770232424.git.m.wieczorretman@pm.me> <CAPAsAGxpHBqzppoKCrqvH0mfhEn6p0aEHR30ZifB3uv81v68EA@mail.gmail.com> <aanievpHCv0Sz3Bf@wieczorr-mobl1.localdomain> <CAPAsAGyiukChPLYO_tQci-7Bvmnnxh+w=bO6eUYLrO3RVuUThw@mail.gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 2a85cbea50d69490acd671149ee415089f8f199e
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AC28E2187D6
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
	TAGGED_FROM(0.00)[bounces-78081-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.wieczorretman@pm.me,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,lwn.net,google.com,gmail.com,linux-foundation.org,siemens.com,sifive.com,intel.com,lists.infradead.org,vger.kernel.org,googlegroups.com,kvack.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-doc,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,wieczorr-mobl1.localdomain:mid,pm.me:dkim,pm.me:email]
X-Rspamd-Action: no action

On 2026-03-06 at 06:22:32 +0900, Andrey Ryabinin wrote:
>Maciej Wieczor-Retman <m.wieczorretman@pm.me> writes:
>
>> Thanks, that looks really neat! I should've thought of that instead of m=
aking
>> separate arch versions :)
>>
>> Do you want me to attach the code you posted here to this patchset or do=
 you
>> intend to post it yourself?
>
>I think you can just squash my diff into the subject patch.

Cool, thanks, will do!

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman


