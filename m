Return-Path: <linux-doc+bounces-78274-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GXu3JcNFq2k0bwEAu9opvQ
	(envelope-from <linux-doc+bounces-78274-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 22:23:15 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7332227E9E
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 22:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 004A8303CA65
	for <lists+linux-doc@lfdr.de>; Fri,  6 Mar 2026 21:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1534B347534;
	Fri,  6 Mar 2026 21:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FfbICJYn"
X-Original-To: linux-doc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C959427F4F5;
	Fri,  6 Mar 2026 21:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772832192; cv=none; b=ucJo3kNQEb6tdkXjbHBKykvDe5R6Ge9jAayPNQ4pmVeMaxgAqUHqZlOdqDiBD+TwsCvaB6HH9qE1qgt1zmD0tut/D5AhGC95IB8gxREWA2DWD3LiJRCJuffRbsDi0DDYolqDUYvHvvSmJDD5mX/diqlhdBsP1mLnkKJ8ed+CJrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772832192; c=relaxed/simple;
	bh=B3ZQFTxLKvPDQJlB9WceKgL9Q9b2Kjqcl9wrROdqszg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXPKwq1RzFpSjxyiuKsliIr9H6LjC0jYQVzl1jAyMgmrHxmt0MtnlFM/dxnwSADHoyZgPul3o0U3LMRxzLGxpkmqIWI08shy3hs3gP4jJudTMzSX9UUyFSVaFLsXJxPDgi67UeMAiPZoFj3CVR2ZTrtprWDTXESA01KZZKzOGwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FfbICJYn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772831574;
	bh=B3ZQFTxLKvPDQJlB9WceKgL9Q9b2Kjqcl9wrROdqszg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FfbICJYnylQFqJN22LyzAWy5L8DZbeKVizCF05BAECwOxaMOLXc50Y4G9vIrEmQ6f
	 H2q7D+swC6HGyQa93gC2reBv7RT7Wq2A5Bc+7XNE7oAu6fUD2ZETMAUF8CppfSU3bc
	 r6Sod6AgqMM18qn+caFCyaNK2TR5JJ7IkhXJ7FmSYhinr7bVvUHiTM8/uug2I21y1O
	 khxg8wKMnwRbxVD+Irj2riN8iMeNKIbMUmYXkG/pAz44PBE+rQc8XhJjAzqcuQPHof
	 XrF1WfrI8qRIR1dEjow8DVXF/Pt4OJiwkP7hL85kXeTD3s2w08YYlPE7/J27ezivBw
	 hKkE/cnHKv0pA==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C68D817E0959;
	Fri,  6 Mar 2026 22:12:52 +0100 (CET)
Message-ID: <e9ec9cd9-6bc0-494c-a804-132f240a5aa5@collabora.com>
Date: Fri, 6 Mar 2026 23:12:52 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 12/22] drm/rockchip: vop2: Recognise 10-bit YUV422 as
 YUV format
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org
References: <20260305-color-format-v10-0-a58c68a11868@collabora.com>
 <20260305-color-format-v10-12-a58c68a11868@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260305-color-format-v10-12-a58c68a11868@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D7332227E9E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78274-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.959];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 3/5/26 4:19 PM, Nicolas Frattaroli wrote:
> The Rockchip VOP2 video output driver has a "is_yuv_output" function,
> which returns true when a given bus format is a YUV format, and false
> otherwise.
> 
> This switch statement is lacking the bus format used for YUV422 10-bit.
> 
> Add the two component orderings of the YUV422 10-bit bus formats to the
> switch statement.
> 
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

