Return-Path: <linux-doc+bounces-95034-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tx1eEjg8S2oiOAEAu9opvQ
	(envelope-from <linux-doc+bounces-95034-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 07:25:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D7E70C964
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 07:25:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=I76f3DA7;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95034-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-95034-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40BCB30098BB
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 05:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACE13B2D0F;
	Mon,  6 Jul 2026 05:25:10 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6383B582F
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 05:25:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315510; cv=none; b=sczOc/zffldrYTUyacE8f45Qxp6iUbA29Ts0J1dbfckvCngoIgrVeFikzzwZZAic8s60YtV1VKY1M2J66MEi65XkZHbq0cjGEH/p7W2NYQxc0/e9/MewWzqNnh6hd61ZnxqAtoFJ8BdxztwFFBh1RgHYTq/jzxaOp+RzHITgrmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315510; c=relaxed/simple;
	bh=4Bx46F9CMmH/tEqR+Xt/BDS0JGlFcMoeBe/M3xKFzqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BO1NXCpUtTifb+5qI1QiruvBw+2HPte48pxIORtgVQfGba9RfewCCAXprKd79Bowy7smyaIjI+qk3ggLPUGlDsRqvU8HKc0zWUui5jeOQVfOa/cLkTl8hLc/9Ww3DVQCbTwjo1gLGj/DqqYkKgGVZyEPK4x0q9wJmYtHgNnItj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I76f3DA7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF8F1F00ACF
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 05:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783315509;
	bh=4Bx46F9CMmH/tEqR+Xt/BDS0JGlFcMoeBe/M3xKFzqk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I76f3DA7a6JU83Z+ueDSptdAyF+BAylqa4KEc6o2VY11K2iO3W2E/Jr2W5OfgtLBT
	 h1MdE4C94N2uWfx2Q72dcE2/+ixCxJf2vkM42bqJuCBRszyD0Gh3z0wungtn9QVSLf
	 R4wQYnUsZhkR/pz6pHDp4AOhFo7J6nZuUdt5akoIt/LXcuwcY2vDhlmH5MeW7tbElU
	 yLiw5jLHhU9VwiQ3hXsrE51lsJ7+vgB2rt8y39S+Gh/3QG5a4tYxEfyvLFLnKxyVit
	 lJ5jRij3JPZGskZ8QcnA1UNC5rtWFBhsyGDrBn2Uyy8lG4cUK9d24pBTmU37yA5l5D
	 BtUpmxVjthVgg==
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-381065a7a03so1819577a91.0
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 22:25:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqgAuLfCnexWm4fr1iTmbQejpdUUR7n7h4AvTJ0v2Qg83xxraQDL21I1jN2JaO8uViAPmzdVFRXk0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeCWcLTfQw1EbdsIE1yfOg3VRZT66tcJPIQgSFcY5HxRIVgWIq
	MHTnp25Y87sCQiELPUIEa3MlxGmgZhzliHmN7GmNM/DRoJA0N3u0ziTgFae1wBSxOrrszEN7/wI
	8gmtbdgfzuUMJzJDXBPOfyy1Up2ftJH8=
X-Received: by 2002:a05:6a21:6e48:b0:3bf:6c04:a816 with SMTP id
 adf61e73a8af0-3c03e4da45cmr8933016637.55.1783315508805; Sun, 05 Jul 2026
 22:25:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702192209.211102-2-manuelebner@mailbox.org>
In-Reply-To: <20260702192209.211102-2-manuelebner@mailbox.org>
From: Fan Wu <wufan@kernel.org>
Date: Sun, 5 Jul 2026 22:25:03 -0700
X-Gmail-Original-Message-ID: <CAKtyLkEmOJYnA6bGJcS_LhCXguu_Qb9c8wSTu7FLwMkOmOeoDw@mail.gmail.com>
X-Gm-Features: AVVi8CevOdtBvIT4J_ZFQWBBCI0WSEViDlR3dK9MMuKMvpsrGDOPD4aafDDVWrQ
Message-ID: <CAKtyLkEmOJYnA6bGJcS_LhCXguu_Qb9c8wSTu7FLwMkOmOeoDw@mail.gmail.com>
Subject: Re: [PATCH] ipe: fix bracket
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Fan Wu <wufan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-security-module@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95034-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:wufan@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-security-module@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wufan@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wufan@kernel.org,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5D7E70C964

On Thu, Jul 2, 2026 at 12:23=E2=80=AFPM Manuel Ebner <manuelebner@mailbox.o=
rg> wrote:
>
> Replace nonsensical ')' with '0'.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
This patch is correct, however, please add a more descriptive commit
message and a Fixes: tag.

-Fan

