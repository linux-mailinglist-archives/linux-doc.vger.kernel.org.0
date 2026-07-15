Return-Path: <linux-doc+bounces-96931-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OpIHF7WIV2rMWQAAu9opvQ
	(envelope-from <linux-doc+bounces-96931-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 15:18:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C526375E945
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 15:18:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Q/MZbeW6";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96931-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96931-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DFD130E59F0
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 13:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5D5420476;
	Wed, 15 Jul 2026 13:08:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332ED42046E
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 13:08:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784120921; cv=pass; b=MUREwvg1dEcRsEq3EmQu7iQ/NRItScQ8u4XVr5dMmFOM6RN6ntUiwPEFPLmDNfRBPu+B2bi3m+mRAWXa11ezkULsk77gRQWC39+ltQODwlPIM86nEOV6uY2OdZz6ikgMlDrtw4rAKMABrh/0JkWkNYX+jR+A+b4fI5Q9gpPU6VY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784120921; c=relaxed/simple;
	bh=mjI03qd2w+xvrv7nyqiaE+Rf0Rqhr+/L9iZXLRDOHaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xk/nPNvP5RCMmNJY0URQqHTQ9MS5TaQ/FYCBFQxKyG7cGXhASNWHUd4UplH6EpaL+XTAvCGjv71mxpt31SREK/HTPg7sPNDm6w1OGC70dFjCu5nxhzZb91zL0VlMlMigqg3GMBN4Z4q2xzt+04x6Yi1aMXTx6qYfdCzt3pvhMUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/MZbeW6; arc=pass smtp.client-ip=209.85.219.44
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8e5be46f663so14635016d6.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 06:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784120919; cv=none;
        d=google.com; s=arc-20260327;
        b=OR7GwPjYT5xSeH+GC2DvFMilK2L0FjW52ZfdZimOlYGw2z36ThaJDSl+/RTAXYcx4z
         LfgBg78iEigvSfxawWmAw+ZLkEFrs1eoPsfRao15e6UFFR5Ilfbg0R3OaSYfkbuq0+br
         Dk8WO+U2EROSlit9eRMYeKpnbBS55tlPY2/be/cZXTZ3BvtIt/WWXiPLEqearInlR3OT
         DdYnBxLvSaZOMe0s9/HIrORhpPiIYhQB3COXjdgx3pOZfGnxDNouY389UKXsGlIaFtKb
         OF0uktbeSTXINjxK8DMxzioUYv7DLgqqeYK2lha4UD79CHQ3SiZMSGl+jTtj9cSMg5/M
         jaag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E9AvNYy2SRR2r8F0yQsxBV7HXUmw83DfY+1fzv5gD5c=;
        fh=vxXzX62FjKW718TzrSabJCCP3ZgZ3nHbgs6BKJNAh20=;
        b=OpbhxJ6WslTebW+zkK5c9JMneGowk2mT9sWlifhhuQIKl1y8+CKY9X1q4hR64+siic
         XHx1QwVZXZC4KUyb4lfIDys+3ETBoywA0BTHIY6fZbYYUcG4s7PgjQ4E528sVU+WROAg
         86pJuoyms5iB55DX0StyBfOaUKmHiIADNVjk/axWAHllxkMWuZBUHaZQ9z7pOtjQ577t
         4GQUxG5g5YOldowdiTP/0QuNRTaQE3wxvvrL+rnp+3Vvo7YWgf306/w7hDMVMJvlRn1M
         WMu/5qU7tRjkajJCsTDhV+Jn/ijQp8qbt9E8SW2RKvZhbbq/Hs/Vsbzcz2HT5IF5Z1z3
         pgww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784120919; x=1784725719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E9AvNYy2SRR2r8F0yQsxBV7HXUmw83DfY+1fzv5gD5c=;
        b=Q/MZbeW6FaoL9HNI3nl5BcV4W5Gyw9VR88onOq1tYNStoBdYLIz/35Bxx9hapczvNQ
         M/3WMajSouDOjFXwrsTWZXrw6jS+AwOsGNtrRtxczwKg0/7On2/YlVtunpPmVUfcAy7t
         PS32dxJ5kU2eqyUZJJ/ru/mDrfuxCWD7Qosu33bSNcjeg8bW+CfqWpVOODyQgQpmdG61
         MtuXqyPoOHLb9WNiXi7bUCBXT/YMiAnpmriKoH35hMEeAEE0YfVL0qMRTm2i6zAY8Y0O
         qudAFDVflpPp7YgyNUXzxLnGlVQJ7Jhgrkqn+Jqaj1q6SIFvJXxJhEco04u3FXtRa/B1
         YpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784120919; x=1784725719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9AvNYy2SRR2r8F0yQsxBV7HXUmw83DfY+1fzv5gD5c=;
        b=QJ2CsONOxFbGCeO3juDNSVNtKYCmV1Exo9Ct+D/OLD3qwXfVFyZTD6rPkbYrRq2LmW
         9nDSqpO89u98G0Bl3vejDAHc41vogMjwIgZIpRsySJR9AGY9Ay0sOfVyLClHdotTIj6i
         lfVhjYC+Pbx3cs/jDuwVlufxQSXaiUWqa+jsRGmTmYwXakX8t+CgjsULQN8RO0shFTxQ
         STiU3ZST5vMikdfaVAd4275bAI3NqUXLLSulUfWCWwyOI+f/sKbm0WkKcUX2AHnjPmR2
         eFfOBvrhJC9glwiwXZw1zbP+LIm+R8bOabcNUIziV98C3PU9McLZGip3gUTEw2wLs9Z4
         eVvg==
X-Gm-Message-State: AOJu0YyLrPyd8Ir/fFNdmjh/z3rlwuIGQgqHhZpoSZf7CrEpjIiOwloW
	jjylNCVwB7gy8ki3scSL9u+Xg6JKFd80i8j+rMhO9dUmTCrawjF5eMg/isGK13JS8quN+irAwHl
	8BG9YkDI2Xp9NGWRto+TyEO/H7PNmRhEFlUfutk8=
X-Gm-Gg: AfdE7cm6rhJSkg0kRsGWlioK4eaacr7EecDsExuqMEP495akQnkG0GalNg6uOOk291r
	iJYY+PftMMY9NgI0cHGKAClegDV0OR4kIexUiaLWWJWkCFvfnix1Xk52l/V37sytrfRnw/+/WZT
	seYiZgNFcaM6AtjzwenAnnmrcCTtI/u71rthBFzmz+bQJ1DlCFf+gmu6YWDwd9sIUcVLwu3pK09
	R40yR0H4Id2C8zKkuIc3/pBLYFnu7qlIgEEsMArTJnuvz/xuQlWFLVDkTv58glaxNZwWun8HiYN
	G0eWAwY/LkqFF7toI1HCKCGj+N//KtEpfXKkzZ/MlGxMiAmZyFNpSwhRG/KsX+cbhYPGqJrFbpN
	Liohm+C8sDuU=
X-Received: by 2002:a05:6214:31a1:b0:8d1:d1e1:8360 with SMTP id
 6a1803df08f44-90400b7f3e1mr183242766d6.39.1784120918900; Wed, 15 Jul 2026
 06:08:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714210124.5364-1-ygorotavio.sjc@gmail.com>
In-Reply-To: <20260714210124.5364-1-ygorotavio.sjc@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 15 Jul 2026 10:08:26 -0300
X-Gm-Features: AUfX_mzxQyesbKL3bQ15nI8G2g1DeaR2fVLNNZbDc7JvRgWysfePayhmsGPSdes
Message-ID: <CAMAsx6cwxED0nBxPGvV7EgbAbWMr2jx1biKsK3u=4enj4vegYw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: translations: pt_BR: process: email-clients:
 traduz para pt_BR
To: Ygor Otavio <ygorotavio.sjc@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96931-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ygorotavio.sjc@gmail.com,m:linux-doc@vger.kernel.org,m:corbet@lwn.net,m:ygorotaviosjc@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[danielmaraboo@gmail.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielmaraboo@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C526375E945
X-Rspamd-Action: no action

Em ter., 14 de jul. de 2026 =C3=A0s 18:01, Ygor Otavio
<ygorotavio.sjc@gmail.com> escreveu:
>
> Translates the documentation regarding email clients info for Linux
> into Brazilian Portuguese, maintaining consistency with original
> formatting rules.
> For V2, the errors "bullet list ends without a blank line" and
> "inline interpreted text start-string without end-string" were fixed.
> The others errors that appeared after the submission of v2 were also
> fixed.
>
> Signed-off-by: Ygor Otavio <ygorotavio.sjc@gmail.com>
> ---
>  .../pt_BR/process/email-clients.rst           | 368 ++++++++++++++++++
>  1 file changed, 368 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/email-client=
s.rst

Also, the new document was not added to index.rst.

> +depois salv=C3=A1-lo como rascunho. Depois de abri-lonovamente dos rascu=
nhos, ele
> +estar=C3=A1 com quebras de linha r=C3=ADgidas e voc=C3=AA poder=C3=A1 de=
smarcar =E2=80=9Cquebra de linha
> +autom=C3=A1tica=E2=80=9D sem perder a quebra existente.

Hi, this word 'abri-lonovamente' should be 'Abri-lo novamente', correct?

> +Ao salvar patches enviados como texto inserido, selecione o email que co=
nt=C3=A9m o
> +patch no painel da lista de mensagens, clique com o bot=C3=A3o direito e=
 selecione
> +:menuselection:`salvar como`. Voc=C3=AA pode usar o email inteiro sem al=
tera=C3=A7=C3=B5es como
> +patch se ele tiver sido composto corretamente. Emails s=C3=A3o salvos co=
mo leitura e
> +grava=C3=A7=C3=A3o apenas para o usu=C3=A1rio, ent=C3=A3o voc=C3=AA ter=
=C3=A1 que chmod=C3=A1-los para torn=C3=A1-los

I believe 'leitura e escrita' sounds more natural than 'leitura e
grava=C3=A7=C3=A3o'. Also, the word
 'chmod=C3=A1-los' sounds very weird in Portuguese; a better and more
standard technical translation
would be 'alterar as permiss=C3=B5es' (to change the permissions)

> +Ao mesmo tempo, ele quebra linhas a cada 78 caracteres com quebras de li=
nha no
> +estilo CRLF, embora o problema de tab para espa=C3=A7o possaser resolvid=
o com um
> +editor externo.

We have the same issue here: 'possaser' should be 'possa ser'

