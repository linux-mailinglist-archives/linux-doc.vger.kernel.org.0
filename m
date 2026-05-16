Return-Path: <linux-doc+bounces-87854-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNe5NrV6CGpfrgMAu9opvQ
	(envelope-from <linux-doc+bounces-87854-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 16:09:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDB255C001
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 16:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4402A3011074
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 14:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9196339DBC0;
	Sat, 16 May 2026 14:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="FkOaEQAi"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEF71D0DEE;
	Sat, 16 May 2026 14:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778940592; cv=none; b=I3zoY9kGU/GTfQnqzzsAeMHNitVGjIoxVOmdtgndPo7xyNF3wAxin7oPYVOabpSN37/Cp7SeAowbMd0WurRcN2wSwichtZWRVx8GhGpCOGHPQMA9Vl9GT0o3T2SMhvMpAM4+ne66Y9GkHxNpanrqBrY+kPm7e+84tDr66278qG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778940592; c=relaxed/simple;
	bh=ou8DOGO+SAzFBsITu8uOd2acXVesjslZQVd52PzTi6s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NrFisnBJo7vNpz5yKuGpOK8anX8ziMtrcgQqA1aNp3LexbhgML93xaxH4NRSpOoSvofJoKl8FD1caUVWlBEATErweWb8bOlLz9P55turmGWm3iQ6kX30x72b4WW2MnT4E5FN+fhRWr+bcUJhdpPsW/Srt+e+BcOxDwH/WRNORrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=FkOaEQAi; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 950D2410B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778940583; bh=ou8DOGO+SAzFBsITu8uOd2acXVesjslZQVd52PzTi6s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FkOaEQAiXekO5PIMvT466xeKe6fz+LPEpA0XS5Uag4J+nfmEdmU6HIrZGBJYOGQgm
	 nuwVf4OtiaO81wyi8KFYxQ+6df+IvzsPQUUccFgd5n5jc2s7FOdOJ8os63dAN3mDLW
	 QKDSFyA/Djymuje+VGi0MT05sb5JoHyLo6GfSya38SyF2KFfGpcI+STADgAHPiPGIo
	 PqJZEVNhHxMc66G6LlBtZu7l917oDvGyX+zDlIPP5Umq/OozWiLWaNYNd8eGKCRiwN
	 w9Kaop3t43V7SN3E72e/KnanMIcfPrtS+RH5lMCDGVTjjqB3QIUc0v0rgn3bPrhLkC
	 e1RYQl4cVVeUA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 950D2410B8;
	Sat, 16 May 2026 14:09:43 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Cheesecake <cheesecake2960@icloud.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Cheesecake
 <cheesecake2960@icloud.com>
Subject: Re: [PATCH] docs: fix typo in mpo-overview.rst
In-Reply-To: <20260516100406.21070-1-cheesecake2960@icloud.com>
References: <20260516100406.21070-1-cheesecake2960@icloud.com>
Date: Sat, 16 May 2026 08:09:42 -0600
Message-ID: <87se7rmont.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 5BDB255C001
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-87854-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,icloud.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[icloud.com,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,icloud.com:email,lwn.net:dkim]
X-Rspamd-Action: no action

Cheesecake <cheesecake2960@icloud.com> writes:

> Replace "transparant" with "transparent"
>
> Signed-off-by: Cheesecake <cheesecake2960@icloud.com>

Patches need a proper signoff with a real name, please.

Thanks,

jo

