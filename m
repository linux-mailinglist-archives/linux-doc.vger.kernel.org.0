Return-Path: <linux-doc+bounces-81111-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDqHNrUpw2n2ogQAu9opvQ
	(envelope-from <linux-doc+bounces-81111-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 01:17:57 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3049F31DF1A
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 01:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0850530FC2E8
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 00:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE901D5160;
	Wed, 25 Mar 2026 00:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="YE1CfLWE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.cock.li (mail.cock.li [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92FD1B81D3;
	Wed, 25 Mar 2026 00:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774397753; cv=none; b=hKMa7sR6sx+oWD1lG9EOWdoEmWqoA0v+9tNLaGu1rIpI/Ry4E5bFT24GjI4XWR+PnqXXmvEGNmYqOPw3mKtZP6XZITpukeXy9wDN2rQUcAPEfOKRXmTgV4FKFcr9wRQs3di72/kfnxxVsYfB8zWhI0po1ZQH4AxLUYjak14dxtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774397753; c=relaxed/simple;
	bh=+CsiFVWL6gkDtGIaeByjh02mpbj/NL8dmZGcz/tZsn8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qNCo77MIiVJ5R1nGAm2to0eYvadUBCJvE8AaYtLUiYe4mrKKiKLOzRxIOqa4+bcuNnqeGlLwzAlQ2BmKpr4Ap/9UdX9yP9Oc47YYTykt85uWhgiahEl0N2DzKSXmy9SmWSJmfvBxL8CQ9Kik7w1bnv53wRbJGFNTu/ObaqfPNro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc; spf=pass smtp.mailfrom=airmail.cc; dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b=YE1CfLWE; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airmail.cc
Message-ID: <21f66cb8aa8e3ede1666bec65540824784041aa3.camel@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1774288244; bh=+CsiFVWL6gkDtGIaeByjh02mpbj/NL8dmZGcz/tZsn8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YE1CfLWEDkAARHfs7o9vvwpK4i68cmWetzK1aUXMd0pHPchFeZjyOpSn2wPMpYlu0
	 RLoXc0LVKieSHbSn6z8PFUiJM5LQpmcjy+t1U5bd2ZG+WEFExdjx8McWcXZSsGXvvE
	 1ClbqM3+x5r3Nak5loGSNJGfT22a/48x10OXSglTM2LyNMChl6XiNQ8x2gleHCiQEc
	 xI0AXrWSTigaKYBqz9j7rDWrDH/uH5ICOhPc2CQL18gh2Rxwz8KOq8qCE9cmKQeonM
	 tcnbnPqHejVjokl9xF/SEAk4JrREwT54tzzpI6Bor3/H4d4AE+zrftiXtyGTozOeAW
	 Q7FNELv6zk5Bg==
Subject: Re: [PATCH v4 2/4] workflow: process/changes.rst: expand and
 cleanup list
From: Manuel Ebner <manuelebner@airmail.cc>
To: Jonathan Corbet <corbet@lwn.net>, Collin Funk <collin.funk1@gmail.com>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 23 Mar 2026 18:50:16 +0100
In-Reply-To: <87fr5ycxao.fsf@trenco.lwn.net>
References: <20260311164935.183495-3-manuelebner@airmail.cc>
			 <20260311165612.184288-2-manuelebner@airmail.cc>
			 <87fr5ycxao.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43app1) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[30];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[airmail.cc,quarantine];
	R_DKIM_ALLOW(-0.20)[airmail.cc:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81111-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[lwn.net,gmail.com,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DM_SURBL(0.00)[airmail.cc:dkim,airmail.cc:email,airmail.cc:mid];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@airmail.cc,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[airmail.cc:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[airmail.cc:dkim,airmail.cc:email,airmail.cc:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3049F31DF1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-03-17 at 09:04 -0600, Jonathan Corbet wrote:
> Manuel Ebner <manuelebner@airmail.cc> writes:
> > remove footnote for sphinx
> > =C2=A0in the paragraph before the list it says:
> > =C2=A0"Also, not all tools are necessary on all systems;
> > =C2=A0obviously, if you don't have any PC Card hardware, for example,
> > =C2=A0you probably needn't concern yourself with pcmciautils."

i understand this paragraph like this:
most or all tools can be optional, depending on the specific use case.
e.g. quota-tools is optional for people compiling the kernel.
that's why i removed the optional markings.

and pcmciautils, the example in the the file, is not marked as optional in =
changes.rst:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
        Program        Minimal version       Command to check the version
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[...]
pcmciautils            004              pccardctl -V

> > remove "(optional)" for the same reason as above
>=20
> Here you have lost some information - now the document doesn't say
> *which* tools are optional.=C2=A0 That is, I think, not ideal.

that's true.
my question is: what are the tools optional for?
or what is the criteria for "optional"?

Manuel

