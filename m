Return-Path: <linux-doc+bounces-73546-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DsSDrxAcWn2fgAAu9opvQ
	(envelope-from <linux-doc+bounces-73546-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 22:10:20 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3095DD5B
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 22:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 86521B0A2CF
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 21:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEC0425CCE;
	Wed, 21 Jan 2026 21:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett.net header.i=@howett.net header.b="qfWGJxXo"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C2B3EDADD
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769029238; cv=pass; b=YPlufBIq0AInraRlQcI3LI3WOZY2lOWHagdQmd1Ee/dCcwCvJfqiWHXg7nBR6LAUtkLHnw5DmJXRCWIgiww0Mm8HLSM4X2PZxdcheF42LcuJ/RlicV4H1i3cwW4a/SBMoje16d0NiAVGhgCzcWhnrJBItU8F5cuvSoo5YvO0KyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769029238; c=relaxed/simple;
	bh=TOB6RppBWiqtDs1Qt/C5GSv+egVwr4macHemePOt6fU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPCGUFpVrHkSaNpheSckhkBciA6YE0HiCHkysWefo0JKgh8ply4q9zaMEK94xWQhxIHJlW1+WPx2lm48cuda/HiaB/eJpGn2WWLJ4psCGRlkRCnsZF7eGni77nhUGKXETOR04NAAGtK7aePbzky4MMkmdtAgLfQPfXnHmMBEXgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net; spf=none smtp.mailfrom=howett.net; dkim=pass (2048-bit key) header.d=howett.net header.i=@howett.net header.b=qfWGJxXo; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7927b1620ddso4423377b3.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 13:00:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769029234; cv=none;
        d=google.com; s=arc-20240605;
        b=HeQc2CCkgkfOAgddByMC9SzUrbmqAOHGjjNIPQRmSH0pRZU49xN48j/482vJmBKSGu
         oMsRRd3X/fWQnuWcKt8aL7wwXNpOiA0qKyagWgWnGzmI7v3pZ0l5ng/fRIxsElfswINB
         JEBWhL+rZEiyB1OoX6XTbfApkQK4dIIAM07M37soitWbg20i9aLZ5A8qgryB4/GX1FfO
         ARtatBlaHy/Sqmkq6vzq3qun89GTzeVkhPuz7kWLMVKIZGH5A6xFCAxPC1oRU4CgTwc0
         pINMASgTkq7GzaDQfmpf6qIWyAZmoDXQKaDr90Adg5chJodtpoGciaVmWHf/asRBZkHH
         5wLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TOB6RppBWiqtDs1Qt/C5GSv+egVwr4macHemePOt6fU=;
        fh=QEVsA3m3HPmkF3WeN2G8Cli9rwogVFo2M1f+eLKR8Ss=;
        b=VDHW8MWyENFmiQna1FV7i8QLOl185RmfNXLHKVRroKn77WjhJcyDXaYx7S4FLzToOQ
         mBE+AoyTT1OW2rn+oPSRQPOdYKfwaR5drNsW+qrpb/UzoXtn5huMPvpp4ztJ/GgO/w7b
         QtwWOnGChT0aH1jGOM4XzaN4oqrsgo4Qr/nljk5BQWJ10w85GHA5M/FOuLL05wdQPwhI
         yBfcuA0G2MJiM60nJZIwJaMl8Sbz3iRxz+CkfQA505Itx8s4deJSoSQ/fewj184/dLKL
         jKYxMBfv0W8OhJ2RBPnHoySCnHElA6dT7cPpCsuX7YF0qAUNgbewdugpEEZB+YgUMJcW
         zjoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett.net; s=google; t=1769029234; x=1769634034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOB6RppBWiqtDs1Qt/C5GSv+egVwr4macHemePOt6fU=;
        b=qfWGJxXoRy0nxjszGi+6dZEAOnp/FuW9nvHUikBmaJ62ioKtSVfqfGcIIjqdSr45Ho
         rg4lBazh59heSZNx7SSOrBo26KLOKnzvBmhc4xgnlcljiMUKIOyz+Hvh5U+yV2XOmxRo
         5JKxWnu6jwAvD8Doi7ldT9Oyhke0I9kDPe7zdxXicDLYAu94IMvU4gg92PTcZdpiO4b7
         oqqt+33Jd86uX8JChcIb9Rq62aj/pfZKg9GxYD6YM7yagxEUjcyE0MlBpP5r+p8gFdNM
         J3DI5YO3dayheSj/guy66jMmTyrIj7s147iSYMKAJUrIdrMRYGwuU3B0lWpcbxty8G4F
         aa4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769029234; x=1769634034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TOB6RppBWiqtDs1Qt/C5GSv+egVwr4macHemePOt6fU=;
        b=R2rs+hFbI1u8QGQbdTCATEiV2FIACh2si9Jl5WBryBrSuo+cmVKChxhIcMyJQEO9Np
         j/GOz375bQOz6WXK7iJSNUAmAgEnq700jWBICI+WjAxANMc4v8rGiyqFSWnQI/KH5dMA
         ErsaLM+CXijWapvYVhSV6aQ2ynxYUgl8BuP/hhNxqEEWGcwW7FO1KlJPEkVEr1NzSyNj
         9qAiKbgdfeFXhOX51MMbfbKfmsfZvKvYy/4gj1qDvuJkcWmSC0GZVIYSrodion6zA41/
         KgD7wia9QoP2pIqNqEhBpkL2QH5Cp2F5xqUvgV2CC8V2tj+RoY2yDcLvY2VIHUztPVyB
         rmOg==
X-Forwarded-Encrypted: i=1; AJvYcCV2PaEAEUoCJeosEOnKuJPVzJfBymlelFhtWaXSujCE6xPLASZNS/CHJi8j/GYDkw0THFulao0fV8E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxok6ujiszToEpxezIcVfBLjEM0v5Obb76oYVqlktHj2WrzcysP
	o3BjtNDwZdYhrtkuMCRB1muUtX1OL606sHaRay/KVWhcDJ/X2PfmJkm3H1KzIe9S478t9BZVIcW
	5oioZiLi8M6YBMfzxkWS76sD8ulQ0+dAUAY8u5zN7
X-Gm-Gg: AZuq6aLDxmz3fnD+si651PnOkPYdpT++WO0XmDxHU9syp8KOejovHWs56RlR8BtVTeQ
	B+RhQZvv9vVy8bneAPrkCWMo6VJZ2CwQt0w7gWepcxPVs1RUzbw47dm21Wht0TeY0Ek+9xAi2Jp
	8AXZTcvmvqBuaFM4NBWCKf3Pl9J0dZbbDbFoFN14Q03Pe98DORjx0+Wd89XV+ru3fUQ3SLdhzUc
	VsicrDpY80r/yqURPspjAqsu6tsJtR1QL/XFuBCB/AQHZKKl3Pe5zLQ5yOJyf1jL583lynk
X-Received: by 2002:a05:690c:6c89:b0:78f:cc97:f8c3 with SMTP id
 00721157ae682-7942a823863mr6872937b3.32.1769029233841; Wed, 21 Jan 2026
 13:00:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
From: Dustin Howett <dustin@howett.net>
Date: Wed, 21 Jan 2026 15:00:24 -0600
X-Gm-Features: AZwV_QjEkOnOrkGBOFHQRskKtLJqCO6O_X6k3EbAJUB8sn6lDOvPd9EiYufqiA4
Message-ID: <CA+BfgNLgZBDxtPQM+s4Q6PXnNHWGKXmSAaoMFdHnfFphK9aAig@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hwmon: (cros_ec) Fan target and temperature thresholds
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Mario Limonciello <mario.limonciello@amd.com>, Stephen Horvath <s.horvath@outlook.com.au>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[howett.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[howett.net];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-73546-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[chromium.org,kernel.org,weissschuh.net,suse.com,roeck-us.net,lwn.net,amd.com,outlook.com.au,lists.linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dustin@howett.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[howett.net:+];
	R_SPF_SOFTFAIL(0.00)[~all];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,weissschuh.net:email,howett.net:email,howett.net:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BA3095DD5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Jan 18, 2026 at 3:46=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
> Tested on a Framework 13 AMD.

Tested on a Framework Laptop 16 (tulip, AMD AI 300) and a Chromebook
Pixel (link, 2013) as well.

For the series,

Tested-by: Dustin L. Howett <dustin@howett.net>

d

