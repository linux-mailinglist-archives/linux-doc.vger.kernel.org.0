Return-Path: <linux-doc+bounces-2701-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 146D47F1919
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 17:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C482928269C
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 16:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CC11E507;
	Mon, 20 Nov 2023 16:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7bE7Vee"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B0293;
	Mon, 20 Nov 2023 08:51:52 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5ca53400c8bso12570787b3.1;
        Mon, 20 Nov 2023 08:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700499111; x=1701103911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MFGQTwe/p7GBPxVFgVzwGs8EnMPhIPZxfWo2nHahZw=;
        b=f7bE7Veej62EQXPe3I1XoC3G7V+tkl04aKzddbKIlj+rLYhW6OnHi4C4ifcuigINJP
         aUPvQ9P/UpJ4NtRpkoTLLMWNRFIk/eXUWc/uPMaUAc23sQqqJln9yoxz0IQH/esi8o3b
         BvpLRNFYBfBE0Wl+SDtaGh6WJ2BF875jLurKAX4jZPF1i7PBLjIAv6BaD/+LyXI74j1v
         lYtKrQzLW1qZSMiK51eoeVoDlSAI2mlF6ZPYJMbcDKCiNr89lyS2lt7dc/zFG92TVRqE
         ChD10ZyBs5MGYN/+8iqx6BC+YCKMK+oif/U5X27v1UDrDz3NArZdiT0nzbTd1o8mYUG3
         64Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700499111; x=1701103911;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1MFGQTwe/p7GBPxVFgVzwGs8EnMPhIPZxfWo2nHahZw=;
        b=X6BLpIFl/4yI2ciCjwZqSwTdp2gCQtCMzjZ8YhNY2LHo9I3Bh79eD9mbx7ZEHUx2rt
         8DuFiY4VachZ5v1oi5ffHoqkB0VYnOjSG+UyxX8rFUq3nbZAr0qar/NaYyDCfq7TQ+Dl
         Es41POi2SIHqeSgtysAA0sesq+qejUuuM9VJpofxxx2tkAgJ7bOpkatoIHrTNVGesZR7
         r8C0Gj+Dth1s3ss0rJspIk3K57lb1cwBqm19Grl8plutu+FBgGjjH392B11gi9bo8jJh
         k7Lh1vBHejAxmIyuRlAjsoNPeBIwL65KOkgpJtPVdFsCmctlKg0fobg1Rhad3VUAUXSn
         wdDQ==
X-Gm-Message-State: AOJu0Yx/FdsvU1pdx4VRRyVIjn/7sNZgZ2T1Xk8C+jk6wWwCcJdctHT9
	dQ4kLhM4nOc65fmE+UzBlViJqLBSKOY=
X-Google-Smtp-Source: AGHT+IG/FdR3lIAJ8c314hUAr7F2oWTexaSKft9EtQHBJBG/amKrMsC/Iye4UFArj+Umh+a4V4PJ3g==
X-Received: by 2002:a81:9e50:0:b0:5ad:289b:999 with SMTP id n16-20020a819e50000000b005ad289b0999mr8863634ywj.28.1700499111562;
        Mon, 20 Nov 2023 08:51:51 -0800 (PST)
Received: from localhost (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id f22-20020ac84996000000b0041b25ebc190sm2772258qtq.44.2023.11.20.08.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:51:49 -0800 (PST)
Date: Mon, 20 Nov 2023 11:51:49 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 =?UTF-8?B?S8O2cnkgTWFpbmNlbnQ=?= <kory.maincent@bootlin.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Radu Pirea <radu-nicolae.pirea@oss.nxp.com>, 
 Jay Vosburgh <j.vosburgh@gmail.com>, 
 Andy Gospodarek <andy@greyhouse.net>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Horatiu Vultur <horatiu.vultur@microchip.com>, 
 UNGLinuxDriver@microchip.com, 
 Simon Horman <horms@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <655b8ea55f3d4_34f291294ac@willemb.c.googlers.com.notmuch>
In-Reply-To: <20231120084805.5f012a40@kernel.org>
References: <20231114-feature_ptp_netnext-v7-0-472e77951e40@bootlin.com>
 <20231114-feature_ptp_netnext-v7-7-472e77951e40@bootlin.com>
 <20231118182247.638c0feb@kernel.org>
 <20231120100549.22c83bd0@kmaincent-XPS-13-7390>
 <20231120084805.5f012a40@kernel.org>
Subject: Re: [PATCH net-next v7 07/16] net_tstamp: Add TIMESTAMPING SOFTWARE
 and HARDWARE mask
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski wrote:
> On Mon, 20 Nov 2023 10:05:49 +0100 K=C3=B6ry Maincent wrote:
> > > Does this really need to be in uAPI?  =

> > =

> > I have put it in the same place as SOF_TIMESTAMPING_* flags but indee=
d I am not
> > sure ethtool would need it.
> > I can move it to include/linux/net_tstamp.h and we will move back to =
uapi if
> > we see that it is necessary. What do you think?
> =

> include/linux/net_tstamp.h sounds better to me, Willem may disagree..

Sounds like the right home to me for non uapi timestamping, too.

