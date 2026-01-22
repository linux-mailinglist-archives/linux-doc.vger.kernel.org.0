Return-Path: <linux-doc+bounces-73636-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF/wM3PicWk+MgAAu9opvQ
	(envelope-from <linux-doc+bounces-73636-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 22 Jan 2026 09:40:19 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8298E634F0
	for <lists+linux-doc@lfdr.de>; Thu, 22 Jan 2026 09:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D2777C53BC
	for <lists+linux-doc@lfdr.de>; Thu, 22 Jan 2026 08:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9803ED10B;
	Thu, 22 Jan 2026 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SQtN+SpG"
X-Original-To: linux-doc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F2530F806;
	Thu, 22 Jan 2026 08:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769070774; cv=none; b=rQCAw9hG1zuPDGYQMK63aKXg5+0WAxNFVUHWImrOfCJ/Qj4fbOoyImyy56Qorwb/0ypYr1P0L6/Vh/HmoIccF9GVQTI8xILOg4XiV6atmWPebHdGKhEu6YpEHNrGQ2nlvRK7ESuQdQthF9pcNoAmn2ExgWZ6Hp3MRrmId/H9cG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769070774; c=relaxed/simple;
	bh=QNluXzU5ZLXVii/ZpNfflC2JtTB2lituAsOqSh4woUM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=HJjfFyHoUgBCRaSdGXTm2vdBUEk6G+R7Unc0//3cASNUFWC9Ug3v3V4oMOhcCJQ8Fatucsi2WWmXo4IEbbMNe+aM41Vhv4dY8trtk791Zg5vEYLEV1MGwAKOT2VkR6rp8Eq8an9k/nwwk0XFthU24QmnMDFKIGQxpk7+vClh7DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SQtN+SpG; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=QNluXzU5ZLXVii/ZpNfflC2JtTB2lituAsOqSh4woUM=; b=S
	QtN+SpGoedsnVaaCNB37XfJnRywaw7rzwNQJpfwezDRML2l5dPLsY9lGKBQNnipP
	nNMe/k16r4TzSNmHXWwWQ5PePum2lSx0hS0bNpKwWV0nNBvBMmwlkvQ0XyzPCOVI
	ggav7e4BDEyVKzYX/edpo7eY7oFRZOZZrbYWZPRE5U=
Received: from andyshrk$163.com ( [110.83.51.2] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Thu, 22 Jan 2026 16:31:07 +0800
 (CST)
Date: Thu, 22 Jan 2026 16:31:07 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: "Harry Wentland" <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>,
	"Rodrigo Siqueira" <siqueira@igalia.com>,
	"Alex Deucher" <alexander.deucher@amd.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"Andrzej Hajda" <andrzej.hajda@intel.com>,
	"Neil Armstrong" <neil.armstrong@linaro.org>,
	"Robert Foss" <rfoss@kernel.org>,
	"Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
	"Jonas Karlman" <jonas@kwiboo.se>,
	"Jernej Skrabec" <jernej.skrabec@gmail.com>,
	"Sandy Huang" <hjc@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Jani Nikula" <jani.nikula@linux.intel.com>,
	"Rodrigo Vivi" <rodrigo.vivi@intel.com>,
	"Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>,
	"Tvrtko Ursulin" <tursulin@ursulin.net>,
	"Dmitry Baryshkov" <lumag@kernel.org>,
	"Sascha Hauer" <s.hauer@pengutronix.de>,
	"Rob Herring" <robh@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
	kernel@collabora.com, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re:[PATCH v7 11/22] drm/rockchip: vop2: Add RK3576 to the RG swap
 special case
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260121-color-format-v7-11-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-11-ef790dae780c@collabora.com>
X-CM-CTRLMSGS: cqZSfXBsdXM9MTc2OTA3MDY2NjU0Ml81N2E2ZjYzM2VlZWJiOTA0MThhMzQwM
 jhiYjQ5ZTYxZQ==
X-NTES-SC: AL_Qu2dC/ycv04t4SSeZ+kfmUgWjuw/WsG1v/Ul1YBSP556jCHp1zA+YHtOI0XuzsGkOiqykTu2XSVH2/VTe6Bkepsbmp04n5ya3owmfms/IzFGIw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4e851a3d.75f3.19be4d426d0.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:aygvCgDnjxFL4HFpB6tcAA--.14921W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7QsBX2lx4EvkPwAA3Q
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-73636-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshrk@163.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DMARC_POLICY_ALLOW(0.00)[163.com,none];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 8298E634F0
X-Rspamd-Action: no action

SGVsbG8gTmljb2xhc++8jAoKQXQgMjAyNi0wMS0yMSAyMjo0NToxOCwgIk5pY29sYXMgRnJhdHRh
cm9saSIgPG5pY29sYXMuZnJhdHRhcm9saUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPk11Y2ggbGlr
ZSBSSzM1ODgsIFJLMzU3NiByZXF1aXJlcyBhbiBSRyBzd2FwIHRvIGJlIHBlcmZvcm1lZCBmb3Ig
WVVWNDQ0Cj44LWJpdCBhbmQgWVVWNDQ0IDEwLWJpdCBidXMgZm9ybWF0cy4KPgo+QWRkIGl0cyB2
ZXJzaW9uIHRvIHRoZSBhbHJlYWR5IGV4aXN0aW5nIGNoZWNrIGZvciBSSzM1ODgsIHNvIHRoYXQg
WVVWNDQ0Cj5vdXRwdXQgaXMgY29ycmVjdCBvbiB0aGlzIHBsYXRmb3JtLgo+Cj5GaXhlczogOTQ0
NzU3YTRjYmE2ICgiZHJtL3JvY2tjaGlwOiB2b3AyOiBBZGQgc3VwcG9ydCBmb3IgcmszNTc2IikK
PlNpZ25lZC1vZmYtYnk6IE5pY29sYXMgRnJhdHRhcm9saSA8bmljb2xhcy5mcmF0dGFyb2xpQGNv
bGxhYm9yYS5jb20+CgoKICAgUmV2aWV3ZWQtYnk6IEFuZHkgWWFuIDxhbmR5c2hya0AxNjMuY29t
PgoKPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIHwg
MyArKy0KPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4K
PmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIu
YyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj5pbmRleCA0
NjljNjNkZDk3ZDUuLmYyMWVmYmNhNDJlNiAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwo+QEAgLTM1NCw3ICszNTQsOCBAQCBzdGF0aWMgYm9vbCB2
b3AyX291dHB1dF91dl9zd2FwKHUzMiBidXNfZm9ybWF0LCB1MzIgb3V0cHV0X21vZGUpCj4gCj4g
c3RhdGljIGJvb2wgdm9wMl9vdXRwdXRfcmdfc3dhcChzdHJ1Y3Qgdm9wMiAqdm9wMiwgdTMyIGJ1
c19mb3JtYXQpCj4gewo+LQlpZiAodm9wMi0+dmVyc2lvbiA9PSBWT1BfVkVSU0lPTl9SSzM1ODgp
IHsKPisJaWYgKHZvcDItPnZlcnNpb24gPT0gVk9QX1ZFUlNJT05fUkszNTg4IHx8Cj4rCSAgICB2
b3AyLT52ZXJzaW9uID09IFZPUF9WRVJTSU9OX1JLMzU3Nikgewo+IAkJaWYgKGJ1c19mb3JtYXQg
PT0gTUVESUFfQlVTX0ZNVF9ZVVY4XzFYMjQgfHwKPiAJCSAgICBidXNfZm9ybWF0ID09IE1FRElB
X0JVU19GTVRfWVVWMTBfMVgzMCkKPiAJCQlyZXR1cm4gdHJ1ZTsKPgo+LS0gCj4yLjUyLjAKPgo=


