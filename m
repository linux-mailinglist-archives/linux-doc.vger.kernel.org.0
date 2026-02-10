Return-Path: <linux-doc+bounces-75786-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HQXFhRci2mQUAAAu9opvQ
	(envelope-from <linux-doc+bounces-75786-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 10 Feb 2026 17:25:56 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A70B011D20B
	for <lists+linux-doc@lfdr.de>; Tue, 10 Feb 2026 17:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B56B301B914
	for <lists+linux-doc@lfdr.de>; Tue, 10 Feb 2026 16:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931E43876D7;
	Tue, 10 Feb 2026 16:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFM5+Joq"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F62B2ED141;
	Tue, 10 Feb 2026 16:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770740753; cv=none; b=SIhKJUN1fIufUnh8GWdCwY7OG7vZPO6RPxPEuVNW5nw8FHn/Uhqhe6DlsK4i/2vzK/C3I/0/DDEuCHLJ5nyuM/rE1Bn7c8+U8bH5HAeubqtFvqpX4PUaUrtoAE0ufPzo4kRykPYEAKrxxTWFGeD/gdpU6Md3gThKT0lZ3k8opC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770740753; c=relaxed/simple;
	bh=/wir6iRl8M3VhbZ6x9JgtCsgH2vMDZx9252IMDQzJsc=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=R23n0bbH33ycD7BjYOTdHxGyHoJSQj/mqYxskqNayqrA28xRrBeorVm0I9NCNLIzvF/SzRkz1+JX6n57jPOYpWvoQIv2oU2M97htyxh5IbFSZ/+5VhGBhcgoKJiSduPIrlfYHavQKEjWH2JeCTllS+DiB1g5NPorUwpissR/Bsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFM5+Joq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD6EC116C6;
	Tue, 10 Feb 2026 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770740753;
	bh=/wir6iRl8M3VhbZ6x9JgtCsgH2vMDZx9252IMDQzJsc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=HFM5+JoqsgG77iBMdOdDaGUaChBd4DkaiTuxtcwCNXsOJlfZxNiH7/xA2FGKMMEkt
	 MdHFy/GjglpYvsoYBTKpLaMiw79YJbgRsBHLZltR7qorARTdCNYI55I3pJgBoPZVbR
	 cF7DnyR0+nlwofqcqiaTYbYadSWXlNUWHkiJCopxrOkTR1N7nwKupyGLAyjdHeZ7d1
	 ZfIatV62Ll4VjNbqYwn1sbWTvXfHCX0r8BTOmLGXC7W07YcquXNNnsqawQjoLPvoaQ
	 ucgrKp3k4VqAHalOM+5w6u+ZVmSG7tOhe1fnmV3HieUjSTDKLRW3pqG1gWDDfAyDO1
	 P2yz7cUfkHs+A==
Message-ID: <f3f44bc5186c0b6f9ddeeae21809cef1@kernel.org>
Date: Tue, 10 Feb 2026 16:25:50 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v7 22/22] drm/bridge: Document bridge chain format
 selection
In-Reply-To: <20260121-color-format-v7-22-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-22-ef790dae780c@collabora.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Alex
 Deucher" <alexander.deucher@amd.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Harry
 Wentland" <harry.wentland@amd.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Leo
 Li" <sunpeng.li@amd.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Robert Foss" <rfoss@kernel.org>, "Rodrigo
 Siqueira" <siqueira@igalia.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tvrtko
 Ursulin" <tursulin@ursulin.net>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75786-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,lists.infradead.org,vger.kernel.org,amd.com,intel.com,rock-chips.com,gmail.com,kernel.org,sntech.de,linux.intel.com,kwiboo.se,lwn.net,ideasonboard.com,linaro.org,igalia.com,pengutronix.de,ffwll.ch,suse.de,ursulin.net];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A70B011D20B
X-Rspamd-Action: no action

On Wed, 21 Jan 2026 15:45:29 +0100, Nicolas Frattaroli wrote:
> The bridge chain format selection behaviour was, until now,
> undocumented. With the addition of the "color format" DRM property, it's
> not sufficiently complex enough that documentation is warranted,
> especially for driver authors trying to do the right thing.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

