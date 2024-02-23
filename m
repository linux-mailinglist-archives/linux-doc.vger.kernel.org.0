Return-Path: <linux-doc+bounces-10563-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E38861298
	for <lists+linux-doc@lfdr.de>; Fri, 23 Feb 2024 14:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 577921C215F5
	for <lists+linux-doc@lfdr.de>; Fri, 23 Feb 2024 13:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AADA7EEF6;
	Fri, 23 Feb 2024 13:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XU8riCrA"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1436B7E78B;
	Fri, 23 Feb 2024 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708694698; cv=none; b=XGXDC2TbaZir5O9EBMRYBTA0pKiY0bxVw59srcklgh8d4wjX9XhInFCXpWX3J2L3DooesMO7CSAq1kY72plWwURHrxrQC7NINNQM0NdUgjETRrBgi/i0pPZtHaJhMOEvaHVojnPbeWvxI1+6xuO5vpYNo2SBP1edEypP/LEm59Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708694698; c=relaxed/simple;
	bh=8w/xnzKDUY29kKgSnBq6a+7mDu2LzuzIM6anbjgh4dI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KsQycVxVYTyYYqakXvylbH1wNWaWYxkjYh3dMVkjggsmZLjmtMu+i8zaliWEQhUenQBmhfmeAmMYjJ9c2wj8/pZzm3vWBCqkQZMvQXOjdiJpdQ375sIClExjwS/KnhNN7ZiBzCC1E8FPNPvAg3CLaWClY/ikQUOldakpNymqROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XU8riCrA; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <6163624c-4886-4cbe-a59f-e2f974f52c14@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708694693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8w/xnzKDUY29kKgSnBq6a+7mDu2LzuzIM6anbjgh4dI=;
	b=XU8riCrAoQ45E2Ul70uO1XTWiHoPaIkBu5hEWZMG2t1+QkdtwUIssCE3zOUUoFwraB/E4y
	6NghuzAmdf5jTKspXXDN+4Zflgvc7ev2hcpvKq97+9uYHrA9BKay5noeEvA2JzdpQligNq
	lFlqsY0pQfKVWiIgITonQZ1lvQea6TY=
Date: Fri, 23 Feb 2024 21:24:38 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7 36/36] drm/sun4i: hdmi: Switch to HDMI connector
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-36-8f4af575fce2@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-36-8f4af575fce2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 2024/2/23 02:14, Maxime Ripard wrote:
> The new HDMI connector infrastructure allows to remove some boilerplate,
> especially to generate infoframes. Let's switch to it.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>


Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>


