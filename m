Return-Path: <linux-doc+bounces-74606-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPeyAWrge2lyJAIAu9opvQ
	(envelope-from <linux-doc+bounces-74606-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 23:34:18 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99820B561C
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 23:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D24233085502
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 22:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE4B36C0D5;
	Thu, 29 Jan 2026 22:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpTNS0PO"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FB236AB7D;
	Thu, 29 Jan 2026 22:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769725749; cv=none; b=ucqdaEf/ZzwF7vhykJSs43Z3w4zI5vNoMlPfuts9yoKrlkLUccS11W3ThvEEp9DKqDmmHrbxBWjiwQ4PBBDfIaKnyPBfm22FtxB3SDKPJxZeFM3Mz7nU822OiDx5juXUIuaH8NzdHbUARdtRBhMgTI86ZbDwCfxBoGRoPk+DVhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769725749; c=relaxed/simple;
	bh=2rXS3Pzprfsua4VsU6G8SdcDmL3QDI093sbQD1oxjMY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Ke/xoHpmscLYubp5+SmMwzmMQYxjm4EHEei2Pt/ftraJ8yOKUia0bzERuyoOqR07u7ZDTbUF+/SSzo6MyrqklFVQ2sTurPodhnJp30iZ4EqNDCGpBRPDS+Du2SDBaoGKR3AMT9Nq6b3dQkYNnICm3SXTDMpW129ydUzKsU2pSl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpTNS0PO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E50C4CEF7;
	Thu, 29 Jan 2026 22:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769725749;
	bh=2rXS3Pzprfsua4VsU6G8SdcDmL3QDI093sbQD1oxjMY=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=UpTNS0POcvypPCURNqScb3R+hnRiXr3CTJByRH3wWu+A+RO5zDI+2uEfYGbtvVDiM
	 g1HbLqSL8LNeqg/742JKrc4gcM+Qw9MCYQw1wo4M5crsI5V9KTKbjGGVqrXAXrc/f4
	 TRDOsyOi9c13polScvRTcUb2w3BVB8T88RuGzvPI4u/Pwarn5odWHniuoGbrHu0mL/
	 ipvMEjJEfjbBpMb7QxG9Ap2BgNEqX2c1KTZmslw7uweBWmDDDA++/r5woSKII3RtyO
	 qJl5h59IvoknOHO215uLjBEL509SM5uNqrZx1ZQ4u1XLikRFHX0kqPetIcrOWmMhKh
	 lAQBvSs9PDi8g==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 23:29:03 +0100
Message-Id: <DG1FF2VY54AO.2Q3YHA4WNLV5C@kernel.org>
Cc: "Jason Gunthorpe" <jgg@nvidia.com>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>, "Johan Hovold" <johan@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Tzung-Bi Shih" <tzungbi@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <shuah@kernel.org>, "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Dan Williams"
 <dan.j.williams@intel.com>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com> <20260129010822.GA3310904@killaraus>
In-Reply-To: <20260129010822.GA3310904@killaraus>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-74606-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 99820B561C
X-Rspamd-Action: no action

(Cc: Maxime, Thomas, Maarten)

On Thu Jan 29, 2026 at 2:08 AM CET, Laurent Pinchart wrote:
> That's what I've been advocating for. The best way to ensure that driver
> code will not accessed data freed at .remove() time is to prevent the
> code to run at all.

With this we are in full agreement, I think that'd be best too. But, I also
think that sometimes this isn't possible. For instance, DRM has such a case=
 with
atomic mode setting.

