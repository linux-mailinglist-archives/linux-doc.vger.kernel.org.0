Return-Path: <linux-doc+bounces-77721-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBoCOPQVp2ncdQAAu9opvQ
	(envelope-from <linux-doc+bounces-77721-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 18:10:12 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 436481F46FA
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 18:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09AA6300D475
	for <lists+linux-doc@lfdr.de>; Tue,  3 Mar 2026 17:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A561351C21;
	Tue,  3 Mar 2026 17:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="N1Zzg/2G"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4667D351C23
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 17:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557596; cv=none; b=aepsgMnAFaG629nfrW9No99nfVGgjmTEq3xJTgem/QXJJyW3kElC4LwFnqfp8qZqvowv2rf3qTGc5F0vN7XQDPsodaG5RQrsvz9/2Es8HxCh8ZX8lVOT32s+FohLfYmKvygHjlfT2F+eIvR0/9gywAqccaaiMEM+DtbzQSx4EFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557596; c=relaxed/simple;
	bh=wRHvv374BAxZkGphZck4WmXNRZuv9brr1GQS0TWa22o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OJqVDi4O40hucwITosTiNgmnFnzyc5vM/VyZEjyD0AXGdryM70uqhc2QNSkCCr7jnj+tXTMvYMDcuTMFeZV3yeq/bPClITWfOazVju39YFfj4KIqqKXvE/iAnOWENHGDKFKLwrlqgzpspZI+F0b6V/kF6iMyHnc1p5p0nrTmFRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=N1Zzg/2G; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 946B740429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772557594; bh=NHgvPPYsaZmDYNAzbF/EvuaDDYgHTUsxhS0JWwIdfXM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=N1Zzg/2G8pDk1psg+pvBL9NKjtHa47EKx+4jiIghom6rD84c4nqFB9hf9oDqnzW2P
	 FRhf3mQUASUBXOYw+TxzjYEWSKtCPP4t8C7zZRD4T7cMLZA0QoYNwlAOssmmKDKTHp
	 hFqw6hh6Ct8p1KvJMllXa1P7hYATUUn7H7MONB3Fuc+4p9n1o/1sIytq87hR93b6yj
	 pavjt6IuW4YXdjb3kW+5swDXv203AXjmmBuDTcrgjKVFOXG/CxGeeNyC9Di3oib1+m
	 /zalPjy0j9vHQijIFIZZtzNDdfpNm0Eetikj9Xb6GEz9EduuMVhPD+yhUWbtG0bPLY
	 DaOsP7ZYyakjA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 946B740429;
	Tue,  3 Mar 2026 17:06:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH docs-next v2] docs: pt_BR: Add translation for
 maintainer-handbooks
In-Reply-To: <20260226225849.268373-1-danielmaraboo@gmail.com>
References: <20260226225849.268373-1-danielmaraboo@gmail.com>
Date: Tue, 03 Mar 2026 10:06:33 -0700
Message-ID: <87o6l4dequ.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 436481F46FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77721-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lwn.net:dkim]
X-Rspamd-Action: no action

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Translate the maintainer-handbooks.rst into Portuguese (Brazil) and
> update the main index to include it. This document provides a starting
> point for subsystem-specific development processes.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst                | 1 +
>  .../translations/pt_BR/process/maintainer-handbooks.rst   | 8 ++++++++
>  2 files changed, 9 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/maintainer-h=
andbooks.rst
>
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index 55f9f377e..de5c005f9 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -68,3 +68,4 @@ kernel e sobre como ver seu trabalho integrado.
>=20=20
>     Como come=C3=A7ar <process/howto>
>     Requisitos m=C3=ADnimos <process/changes>
> +   Manuais dos mantenedores <process/maintainer-handbooks>
> diff --git a/Documentation/translations/pt_BR/process/maintainer-handbook=
s.rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> new file mode 100644
> index 000000000..eb650bc60
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> @@ -0,0 +1,8 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Notas sobre o processo de desenvolvimento de subsistemas e mantenedores
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +O prop=C3=B3sito deste documento =C3=A9 fornecer informa=C3=A7=C3=B5es e=
spec=C3=ADficas de
> +subsistemas que s=C3=A3o suplementares ao manual geral do processo de
> +desenvolvimento :ref:`Documentation/process <development_process_main>`.

By now you know what I'm going to say here...:)  That is another useless
top-of-the-file label.  I won't insist you adjust all of these (I've
applied this patch), but I will be removing this label in a patch of my
own.

jon

