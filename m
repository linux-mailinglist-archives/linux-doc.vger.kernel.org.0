Return-Path: <linux-doc+bounces-5750-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A6D81C13E
	for <lists+linux-doc@lfdr.de>; Thu, 21 Dec 2023 23:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 721B5B2481C
	for <lists+linux-doc@lfdr.de>; Thu, 21 Dec 2023 22:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A50978E7F;
	Thu, 21 Dec 2023 22:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="UnF8TEXi"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CC478E64
	for <linux-doc@vger.kernel.org>; Thu, 21 Dec 2023 22:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3ba46a19689so1062199b6e.3
        for <linux-doc@vger.kernel.org>; Thu, 21 Dec 2023 14:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1703199325; x=1703804125; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wqXIOVr+zzGcBTuOnYOshrpme+1OoQLq7CD3XZTWNYk=;
        b=UnF8TEXiS4x9F9YYTnX7J/n5HYzBqrH6eIFSrtNYm/gR1txdNnZP83Wq6Ubqg278Ap
         zFr31wXp9hf+nAVHB75rBDkx0einNYjcg4Hp1X2HW/J1aFUHIS3Igo1/dIDHvY9lHVaC
         gQ3IqaLmMXayimQNv2e0Jo0LrKYQ5kXsQEE8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703199325; x=1703804125;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wqXIOVr+zzGcBTuOnYOshrpme+1OoQLq7CD3XZTWNYk=;
        b=P9nOgtYk0IzVonGHGjMpwdAjLxIYNkzRks6l4KiqZjtPofJ/ALFftSTJ6RceEVq8uA
         ZMARqrNYiCTNSbDqRvFzok1Vx9X2s+18eXk9SmJzyeZ8jdktGgR5AfHWKqYB+dPNZ1c2
         3s2VFgCR1uSsNmEIs45WyNiFaIjxyc2xhWv0YdoKrOK3c+caEo0OfPnCNU6CTizKviIQ
         tT8N6Rjpu/gWB2+9nDOMu4hCkjnznozGE8QwObZ+UNSR6Ikn/Tco4aaWWIRPEtmoDNQr
         Dcpu09XRe12byVowsfEsOOEhfuXSxpYutJ5cfdq3uIYBKgD/e4qQXWKFrSdvag3al2D1
         rEgQ==
X-Gm-Message-State: AOJu0YzDyxy8Nr25Q8R6iKJTbhug+PJzaxTdUIySfbYMpWNIEIFebwTk
	zMk/pBsue+3X4HaBEAGUVIlYNJFIrhKxWA==
X-Google-Smtp-Source: AGHT+IGb5yHPr5yL48MF5WsWm9Y7cxl8mGGDhYBlsAeD26LEAwYhBDQIvfRTLO6USodEGOeVJKAM+g==
X-Received: by 2002:a05:6808:648d:b0:3bb:8958:363e with SMTP id fh13-20020a056808648d00b003bb8958363emr178887oib.118.1703199325253;
        Thu, 21 Dec 2023 14:55:25 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id g20-20020ad457b4000000b0067f454b5307sm924400qvx.108.2023.12.21.14.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 14:55:24 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: linux@roeck-us.net
Cc: corbet@lwn.net,
	hdegoede@redhat.com,
	ivor@iwanders.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luzmaximilian@gmail.com,
	markgross@kernel.org
Subject: Re: [PATCH 1/2] hwmon: add fan speed monitoring driver for Surface devices
Date: Thu, 21 Dec 2023 17:55:21 -0500
Message-Id: <20231221225521.11671-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <ab8a1ff3-6d01-4331-ba5d-d677d1ad80b5@roeck-us.net>
References: <ab8a1ff3-6d01-4331-ba5d-d677d1ad80b5@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

> No, sorry. Limit attributes are supposed to be used to program limits,
> not to report constant values to userspace

Thank you for this feedback, I've proposed improvements to the
documentation in [1] that clarify this. I will incorporate this feedback
and submit a second version.

~Ivor

[1]: https://lore.kernel.org/linux-hwmon/20231221225149.11295-1-ivor@iwanders.net/T/

