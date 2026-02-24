Return-Path: <linux-doc+bounces-76732-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO1pCahPnWkBOgQAu9opvQ
	(envelope-from <linux-doc+bounces-76732-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 08:13:44 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEDF182D40
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 08:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8EB9D3025E1D
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 07:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815A132F74F;
	Tue, 24 Feb 2026 07:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="DVDCNTx+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E9732AAD1;
	Tue, 24 Feb 2026 07:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771917198; cv=none; b=osy5K+n4Eo3V3ZtZ0qYthZa18J3E8Hz5wokzk6Eh01xBXH5HJ+vO95wa1QkIyLdkHCLsNAXZ/7s7QYM0Zi+wlgY1lR4Do82PcE1Uq8bXy9noaQE1tNF1/pUyj+kr16++FSXxQF8BHr++9dl+aFZyWRJdvZC3ywi0yarnhyoJDyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771917198; c=relaxed/simple;
	bh=hcAM6Ed0s7f8Sa/Rllr4+lGoxkewCaTbYnGNrVm0ejU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RNXYzyLtOQtVoRFUDKRmMLOjTXeaHb5GkGYt/Ay7rBQuRN3M8iTztnBtHcpjTHFdT0KFu8tnrmG6hdUFUJtJimUUPaG7iAvS2ODbr7DRgCANPIqIeWULWoRewzCqoB70J9XWlZFun9+iVTfUNQ1myUpp2gU/4YN4WoReifDR3PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc; spf=pass smtp.mailfrom=airmail.cc; dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b=DVDCNTx+; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airmail.cc
Message-ID: <38a8cc54e378eb11cd3e161ad3a90a7de40291d5.camel@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1771917184; bh=hcAM6Ed0s7f8Sa/Rllr4+lGoxkewCaTbYnGNrVm0ejU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=DVDCNTx+wQPHRc6bRvcVAXaOLoJQCC/3rIr0rfyKsJO7WerLEohLv4pAaCbkP1cvu
	 /fM8f1TmdhefyudMRCqvo9dUzpwGX8J3KDjF8Ox/fpL4CeDaPakIjWNcsEsQyMd8JP
	 3qornZPeS2ARKxLqW5JOLHkZcrVXYVaRhiRLHbcckkrsbuHRCAtmn9fmzC/VK2go28
	 yjEtseT0TPM2zPqNLaxdKgslmCrgL91/uDl1TmtKg59jaCi1th3QVAD62c3lrogti5
	 XDRenJ/3QoXY7mq943+xvyvjVGC7oDwk4I9NUtC3PySEHvYhAR/BWBaKKu8vcI0X4B
	 I7FQZQ/cLVpFg==
Subject: Re: [PATCH] scripts: sort ver_linux and list in changes.rst
From: Hans Anda <hansa@airmail.cc>
To: Jonathan Corbet <corbet@lwn.net>, Collin Funk <collin.funk1@gmail.com>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 24 Feb 2026 08:13:02 +0100
In-Reply-To: <87wm032kex.fsf@trenco.lwn.net>
References: <20260221152113.28322-2-hansa@airmail.cc>
	 <87wm032kex.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[airmail.cc,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[airmail.cc:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76732-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,gmail.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DM_SURBL(0.00)[airmail.cc:mid,airmail.cc:dkim,airmail.cc:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansa@airmail.cc,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[airmail.cc:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3FEDF182D40
X-Rspamd-Action: no action

On Mon, 2026-02-23 at 14:56 -0700, Jonathan Corbet wrote:
> Hans Anda <hansa@airmail.cc> writes:
>=20
> > It is a pain in the ass to compare the software versions on the running
> > system (scripts/ver_linux) with the minimal required versions (changes.=
rst).
> >=20
> > Sort both lists alphabetically
>=20
> So ... I suspect that the intent, in changes.rst anyway, was to list the
> compilers first and group other stuff roughly by category.=C2=A0 But I ag=
ree
> it's kind of a mess; if it's really by category, they should be
> explicit.

Well, actually not. i considered categories but decided to sort alphabetica=
lly.
Because it is simpler and spared the decisions which tool fits in which cat=
egory.

> If nobody screams, I am inclined to apply this change.=C2=A0 But ...
>=20
> > Add missing tools in ver_linux
> > =C2=A0(bash, bc, bindgen, bindutils, btrfs, clang, e2fsck, awk, tar, gt=
ags,
> > =C2=A0 iptables, kmod, mcelog, mkimage, openssl, pahole, python, Rust, =
sphinx,
> > =C2=A0 squashfs-tools, udev)
> > Fix minor issues (add grub2)
>=20
> ...these are a separate change and should be in their own patch.
>=20

i will make a Patch series with the files split.


Thanks for the feedback

Hans

