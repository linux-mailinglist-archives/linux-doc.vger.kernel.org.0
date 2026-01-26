Return-Path: <linux-doc+bounces-74022-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFJbHMCRd2m9hgEAu9opvQ
	(envelope-from <linux-doc+bounces-74022-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 26 Jan 2026 17:09:36 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC6A8A802
	for <lists+linux-doc@lfdr.de>; Mon, 26 Jan 2026 17:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D089330234EF
	for <lists+linux-doc@lfdr.de>; Mon, 26 Jan 2026 16:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592122D738E;
	Mon, 26 Jan 2026 16:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kK1zUPcn"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F3B2D47E1;
	Mon, 26 Jan 2026 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443705; cv=none; b=Inpbhc8te8OP77dnfQ65EtM2d8AV7eDvkUUlBnO+Z344w0wWwRpEPYr4fLuTExKZazelGP3a0pqON/2YWHxzlzAHsT2pwW1fRb2Yj49zDYdLwfnddXSfABaqjXH0qZ6GCLxylohL25J1g2uWOilFsmlxiKqA9Kpo4ftnLHWpQVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443705; c=relaxed/simple;
	bh=cE9bdmoIZvSsIl5vl+7x+yoqNT1kYkQq4l+F5aZ8ERA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=OE9YZQK5aaNMOy9TWinVqkc3B0aPskxh9ba0umRooBrdSSex1erqW1yv5jG1DdHYxKAYcbzvVvS57DFyLyjsT7ctSyPEQZCxOgXuqFG8mX/X07xx3n6i6ztvpTznYvA6mWGljlhK6fBfHEFXVMO8n83nGdrOm9qYrOjOM4SaSLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kK1zUPcn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89E2C16AAE;
	Mon, 26 Jan 2026 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769443704;
	bh=cE9bdmoIZvSsIl5vl+7x+yoqNT1kYkQq4l+F5aZ8ERA=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=kK1zUPcnc6lpR2flLONsVoIrrvoP9MKAkvV/8n9AoCsr00ab0v713pOs2DY4In9dj
	 TWJc3yfQIonsE8mqbP9ukDIP22nfAasdQXYeDs7EguAwSI7hUZWLFRCG6jBjwEqCwO
	 3svQNMoOueF2aNT42ECAcOtw6XTiNskUKTy5zwq5jGgFN93hNDkIZt71ZARWF5SSJX
	 pV3GCiQ70gG58SDAd1uqyzodvY6SSwBs7WO19IVWT5qAS0Aq42C4Pd/h9JkiJW8jgn
	 DOkGPiGnEMp1jYA+QX2VEPaB6+Ww8TRTjbnggtZZnDCpDkoMvUFAeECEsfRzXBZ4Sa
	 FEYx4h6Rt5New==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 17:08:20 +0100
Message-Id: <DFYNFXYTXBIW.314K249BPTA1Z@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Johan Hovold"
 <johan@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, "Tzung-Bi
 Shih" <tzungbi@kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>, "Linus Walleij"
 <linusw@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <shuah@kernel.org>, "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Dan Williams" <dan.j.williams@intel.com>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <DFXV1QMQMTRK.2W8SWGVHS2K69@kernel.org>
 <20260126000730.GI1134360@nvidia.com>
In-Reply-To: <20260126000730.GI1134360@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-74022-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DCC6A8A802
X-Rspamd-Action: no action

On Mon Jan 26, 2026 at 1:07 AM CET, Jason Gunthorpe wrote:
> That's the whole issue with DRM right there - allowing driver code to
> run after the driver has unregistered from the subsystem is
> *dangerous* and creates all these bugs.

Unfortunately, it is necessary (at least to a certain extend) in DRM. I thi=
nk
there is space for improvements, but I don't think we can get rid of this
entirely, especially on the KMS side AFAIK.

(KMS is not exactly my core competence, so it would be better for someone e=
lse
to explain the details.)

> From a rust perspective I would argue you should be looking at every
> one of those try_access_with() sites in drivers as a code smell that
> says something is questionable in the driver or subsystem.

Agreed, if that is necessary it requires special attention and justificatio=
n.

> In many other subsystems a driver should *never* use "try_access_with".
> Unfortunately the rust solution forces synchronize_srcu()'s anyway (which
> Bartoz rightly pointed out as an unacceptable performance issue).

I'm already working on patches that get this down to a single
synchronize_{s}rcu() call on driver unbind, which is not a hot path at all.=
 So,
this should be fine. This should work for C code as well.

> IMHO since rust has the Device<Bound> stuff the revocable should have use=
d
> rwsem, because the expectation should be that the majority uses access, n=
ot
> try_access.

Yes, the majority of uses is access(), not try_access(); not sure if rwsem =
is
the better solution though.

