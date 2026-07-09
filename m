Return-Path: <linux-doc+bounces-95980-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g2agLmmzT2r2mwIAu9opvQ
	(envelope-from <linux-doc+bounces-95980-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 16:42:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B3E732677
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 16:42:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TnOQnGOR;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95980-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95980-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ADD7E3031B3A
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 13:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFD232AAC6;
	Thu,  9 Jul 2026 13:51:44 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF6A430799
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 13:51:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605104; cv=pass; b=aH7UN2lTb85IdhHC9hHtoRfAdgZy2H4bduu02t7CM3h51NhrEGcXPiQWe6D5uzqiuf7h4c8Ic0tpOZuuJAOcTUSzk1mGRAU1fGxSGWLSTdl5zSjed8xnu/3PYH2GtFT/gKveMMlnqMSavod6eZ0mQBi8yl3YN2RCVX4NE8U42ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605104; c=relaxed/simple;
	bh=cP2eCBR04jml/7MTMjp5phR7VgWJ0CqsTpqvNBw2ab4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gMIqBgxYi7e1vA+2JAjLypGxnJr/UR1K+VIn9C0+ny69YG/9dKNdxzioEAvzKv+cmupkjhkW7s2Kg8D/I7ezhKcdu5vdPJnxjw8+6etEip7KXohqgjjiCnuYu8cYCLsA9QJv1DuZxCGLVpdI2jeLwkdPkUAb1bjCbMbfCrPi1aA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnOQnGOR; arc=pass smtp.client-ip=209.85.219.51
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8eff5ce3b95so13347746d6.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 06:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783605102; cv=none;
        d=google.com; s=arc-20260327;
        b=OXseg7Nsdbg3VQAtSDd74+Qe+BGSmVzZ3lGj4BuB2sOM8X+Yij8FlvrpsDuIXvb6Nr
         dDXxh4Fw4ZXELFu/e58OltExEYVH2bDRBawIQ9nTZAr9ZgJFEL4RvB0/bgMeeMNA24jF
         YGf4SI+3MNvmVEH8gmvB9yHifGaAp6F2f1R/pkHqhtSScG2U91caRXRytP5AKmNU3H3M
         H2yNs75qJxWvPVWbe8HVpfoSEuSRt0MZmUuoSOMnD9q2jzcLrnVAwk09j+LOC8sktLQL
         YiehdwPfGnI4BWDh4pGf5mZwctIvDUWafdF3SZ0VXGrc2/PvBO7hO24clf6bGNfqn22R
         Z1CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cP2eCBR04jml/7MTMjp5phR7VgWJ0CqsTpqvNBw2ab4=;
        fh=kPd+0CO5eMXdCCEQ8RVuPiiZeMTY/UsdKBGF0EIcNjI=;
        b=Kf3A6PxYy4gZ1Xtw78elZrPQc4EWm7ikJY/nK5KFYiQEBUNSDTCuiJ4WJwQepYsExl
         QUUm070t5j3odffYJEDaxPeebL3Ui9aqTnDjv4PVqKEULfuKqgjq8EJgFxDL29Qy3wKh
         0v70fUOjwIJqB8QLetOyQssdJ2w4m8UNI8u5f8T9i8Mw/r5H6mmkkhqq4XqxcNP9ebuU
         MCWmWvlPL0I1EW98Wc8MEtn2VibWvFqyTYQ3woCBefdznAEvlzij7Ggz8uDXys/mshD0
         EFtc9/SyITHJFykYbe01t0Mzq3k9JY5hlYTtsQFMBxoiolXrURYgpv1ABB88+GyL1Wwf
         F+NA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783605102; x=1784209902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cP2eCBR04jml/7MTMjp5phR7VgWJ0CqsTpqvNBw2ab4=;
        b=TnOQnGORHCCmGiYk4gxnM+JJNz48wbRUKn87bxyPzYp/ZuBt8Ba0DHndSt6HUXIalR
         Mhhsu+o5tX7D040adfeLd5gGUWTxGL02ex9phw+GUpdT88CBEg/Vc4lV4qr5VZe7EMFM
         4734Ineiwowq8tNkih/zxTABKrWWDADb1uFYOwQGEojwLxWu+M8KQ3ueDeDhfEG/eW1p
         yejJq0EDLiQOqJDMRqD+UWCKpICcVwnDvRmWEwKls8uKqIlBZ++9m9OL3Vd0JlO9cjaA
         nmipesRe5QGVHuxi+xWrgUAL9Ybw0KDZ7B06FD5pQXEfdd1+p5lGU+s1jZLkTTe238vJ
         ZveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783605102; x=1784209902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cP2eCBR04jml/7MTMjp5phR7VgWJ0CqsTpqvNBw2ab4=;
        b=mIX7sjfFXos9uHaxjcEZD8jW2jk4PptPd95NNogMmE0qINJYgpdD46ZHYq6TvTxtfi
         w4jNUDO4IDlhYe432svEjjKU5xe64Pw4eQHBlpoKwJGgoIbyVr10yvkzTqVfpOKADEqs
         3yoJPTIrAjWa4djQ/7KOULc2M59JjeLtX1FzDL8Ibn8rCzFA15yerdfHrs6HU9/Q8tCI
         OUGvI3Z2N/UDhTX1zCsN5c2wQd2foDGs1QO1dfo9mhRMSKfSXIjhcGYKj+aKFdISAm13
         N3VeI0Hy6y0KfW9u0my9+lp5R87t+G9ctol7+CCPScdVwR7+XhtbZgEL2qxKPhCKvVR4
         8V5w==
X-Gm-Message-State: AOJu0YySqUNHMaxosuFWJyoMDOq3ppFT5tqw4Pf1BJTwA0fwb7a0kbrJ
	D7wp8dEcpTCnLfuGTEet8+zyGi9ukpOxHneCFyqWE41kautB0lnFisUPnBEbikZC3+wFV+TkmqK
	pKGNeiVW9AHcvixhMkdV8jj/LaWSAOcczXQAC7Co=
X-Gm-Gg: AfdE7cmJ/0cNlZyoMHWVMFRw1zHFnaQOqxHrjJ0k22BaOe+izLwd3PZOA6gXsyGSoX3
	rxLrWdnoAU89fDyJEHVh78+gpPs1VX7+bhmSW6arHjmU+93NlhhQChsTiqVJFE+TOXagGbnuA5d
	PPKrrN6uI8w43ozp1ooBt1aCdSfafjG0WS65G+z5LNPDyHW4O2ZdVqWDrMZS/37sUl3FNMRLFaY
	9/GU+wnJsOt1Cw7LzsUnVJjEgYXmw5Rv8nCsVbS4tDrXgPftmELYRc3b/O9IqMcmOoeERP8kYal
	HuvFEWEywMOg0vgx96sobcWNFBGCxKP8cAEB8qtIylYJIO0GsLyjBfPyi+tDBEhda7Ztl20o716
	ena5cWAUlIg==
X-Received: by 2002:a05:6214:226b:b0:8f4:d86:ec0f with SMTP id
 6a1803df08f44-8fec13a7ee0mr83752686d6.27.1783605102266; Thu, 09 Jul 2026
 06:51:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709131213.1216-1-silvapfabio@gmail.com>
In-Reply-To: <20260709131213.1216-1-silvapfabio@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 9 Jul 2026 10:51:31 -0300
X-Gm-Features: AUfX_mztIoPUWPHFcsorg_pjpKcwb_UaZsoydk6nHrDzfwnaWFLPQbgyx-FahhE
Message-ID: <CAMAsx6eZPuemkce7EPUJQMaN0k8fBmFLMgM3Gv8eA9Ns7i8ZFw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: process: Translate CVE documentation
To: Fabio Pereira da Silva <silvapfabio@gmail.com>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:silvapfabio@gmail.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[danielmaraboo@gmail.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95980-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielmaraboo@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9B3E732677

Em qui., 9 de jul. de 2026 =C3=A0s 10:12, Fabio Pereira da Silva
<silvapfabio@gmail.com> escreveu:
>
> Translate Documentation/process/cve.rst into Brazilian Portuguese and
> link it from the pt_BR documentation index.
>
> Changes in v2:
> - replace "conhecimento especializado" with "conhecimento t=C3=A9cnico"
> - change "atribu=C3=ADdo contra o kernel Linux" to "atribu=C3=ADdo ao ker=
nel Linux"
> - reduce repetition in the applicability paragraph
> - replace "=C3=A1rvore de fontes" with "=C3=A1rvore de c=C3=B3digos-fonte=
"
> - replace "grandes n=C3=BAmeros" with "grandes quantidades"
> - remove the repeated "qualquer" wording in the same paragraph
>

Hi,

The grammar makes sense. Thanks!

Acked-by: Daniel Pereira <danielmaraboo@gmail.com>

