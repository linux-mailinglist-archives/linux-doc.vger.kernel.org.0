Return-Path: <linux-doc+bounces-19918-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DA1923EB7
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jul 2024 15:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D7071C2250F
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jul 2024 13:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332E61B3F1E;
	Tue,  2 Jul 2024 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="emnKcO9R"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3B118C35A
	for <linux-doc@vger.kernel.org>; Tue,  2 Jul 2024 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719926387; cv=none; b=iwRyUP91GgWz9++lwjLkHIruuo3SbE14nUByBumUviDzx4v2VhTPxbWkc8AzzG73wiVCGekpGjEgukGCMaNrdOPUurm/BSh0FgBgUavXNA/u3YR6oN5VsGCvrK43QaFQBtmXfxnJr57LDLxpm5H1sneS6m/hrc/NQwCWoL+OXZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719926387; c=relaxed/simple;
	bh=Ri2OlNdqm6+frOnytDrJauYbkPW4MU889L3TlKhT20g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mFU8Sp+Z4gnQTF2DLn/5oi7Lgdj9XOr1DAlbJsyK9NIQu83avx46hVdIepFjBVdyhzBDOPwjE47vpTzcrBlQ0+RkpvqqsRngLYFTzHeLWFoasldrg/X6n3HcXzdf+o3Yu2efT6udjenjsZ9rA5ZCMnvDibctn+ojV7MjevhryL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=emnKcO9R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719926384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=k4t3HYIWPAnXFThWat7RXWIQu9AR4mO328pEd1oUXQs=;
	b=emnKcO9R93mjLpWYx4ydg7vSEDsWoQzGLDtCGcEBu/USz+U7dqYQX2AACMx82V0D+4dc/U
	M545I1/3AZDhEUAkzb8IzbgdV8YEvyJ9uVGpdkf5YDQhD0iXVpswL11n0Mk9Npw2t5wPoE
	3xm+605tyy/gmLiQOwiJ7nMDsOC6WRw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-MUQVppQYNiukwCJMhL_A1A-1; Tue, 02 Jul 2024 09:19:43 -0400
X-MC-Unique: MUQVppQYNiukwCJMhL_A1A-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-367895ae92dso102880f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jul 2024 06:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719926382; x=1720531182;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k4t3HYIWPAnXFThWat7RXWIQu9AR4mO328pEd1oUXQs=;
        b=bQMgW1cEq3qDyVVTz82FSRj/11xPVZ1wDv9tD+aqA9YhN2Zk/oiVqRgHSgGFU5msgU
         LJ+538auRngQBNjDKN5rjrIpI6vSEHmnZ42NSNJ/E8QkgUYB35dMdofWZiQw8pECtMBt
         oAxgoHPTiOfuQuN7QQh+g26ULZQCIUKdN0xb/mS1hlal2CUektgsPhPVMf67MqX0w186
         UNS3S8O6Lra0kGJotIK6QFSu3yW/+uYkmHHZJ+M0tey/CCsrJ+z3ymi4M4706piwHwPO
         RjXS09ZBudBVq8wCuvXMlf9JluSnRThAjxyYeRnaCqLYqxxG4+IGuEZq6w+Qz02n2INt
         1DEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBhqLAFpxASkkbWdHnD6uxTfiHmR6spNXXzdwnOiSyzVJso5zbQHgNo+9Eny12Yag8vH8WPVeM/dKihv4zb/zLWY3LN2xk4Tql
X-Gm-Message-State: AOJu0YxuF9UaCMaiJy0IYfTuLzU7TWrwRDTp+Ir9WMOz8I6zQWJnWXuI
	rFlsaR9cgicrY7GANmKHZdlZfQRW9V2CmmsaX9armQ3qw+Q8SJs1Qnl0Xe7ZiOCHgslmoIbDXof
	UsvWrwuGK64AWivGwDayqGVxeK2vPAoUcyYKqyomp5ihM67rfD80F6I3YtQ==
X-Received: by 2002:a05:600c:4848:b0:425:7ac6:96f7 with SMTP id 5b1f17b1804b1-4257ac69876mr57582325e9.0.1719926382060;
        Tue, 02 Jul 2024 06:19:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMqbmBmqm89pN9bKVVywZSK576kfBQm2aipe3OWPR1KebDTcG/r9YI4+9+6wjKKkIIlL4W7g==
X-Received: by 2002:a05:600c:4848:b0:425:7ac6:96f7 with SMTP id 5b1f17b1804b1-4257ac69876mr57582155e9.0.1719926381667;
        Tue, 02 Jul 2024 06:19:41 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b0a6:6710::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af55cccsm198502145e9.16.2024.07.02.06.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 06:19:41 -0700 (PDT)
Message-ID: <8ee273f0647d00ee23f964e3f3f4a216c8413b84.camel@redhat.com>
Subject: Re: [PATCH net-next v5 2/7] netlink: specs: Expand the PSE netlink
 command with C33 new features
From: Paolo Abeni <pabeni@redhat.com>
To: Kory Maincent <kory.maincent@bootlin.com>, "David S. Miller"
	 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	 <kuba@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, Oleksij Rempel
	 <o.rempel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Dent Project
	 <dentproject@linuxfoundation.org>, kernel@pengutronix.de, 
	linux-doc@vger.kernel.org
Date: Tue, 02 Jul 2024 15:19:39 +0200
In-Reply-To: <20240628-feature_poe_power_cap-v5-2-5e1375d3817a@bootlin.com>
References: <20240628-feature_poe_power_cap-v5-0-5e1375d3817a@bootlin.com>
	 <20240628-feature_poe_power_cap-v5-2-5e1375d3817a@bootlin.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-06-28 at 10:31 +0200, Kory Maincent wrote:
> From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
>=20
> Expand the c33 PSE attributes with PSE class, extended state information
> and power consumption.
>=20
> ./ynl/cli.py --spec netlink/specs/ethtool.yaml --no-schema --do pse-get
> 	     --json '{"header":{"dev-name":"eth0"}}'
> {'c33-pse-actual-pw': 1700,
>  'c33-pse-admin-state': 3,
>  'c33-pse-pw-class': 4,
>  'c33-pse-pw-d-status': 4,
>  'header': {'dev-index': 4, 'dev-name': 'eth0'}}
>=20
> ./ynl/cli.py --spec netlink/specs/ethtool.yaml --no-schema --do pse-get
> 	     --json '{"header":{"dev-name":"eth0"}}'
> {'c33-pse-admin-state': 3,
>  'c33-pse-ext-state': 'mr-mps-valid',
>  'c33-pse-ext-substate': 2,
>  'c33-pse-pw-d-status': 2,
>  'header': {'dev-index': 4, 'dev-name': 'eth0'}}
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

This does not apply cleanly to net-next due to commit 46fb3ba95b93
("ethtool: Add an interface for flashing transceiver modules'
firmware").

Please rebase and re-submit.

Also it would be great if you could add some documentation to the new
attributes.

Thanks,

Paolo


