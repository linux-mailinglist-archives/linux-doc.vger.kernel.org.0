Return-Path: <linux-doc+bounces-84136-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPnnJ6+R6Gl9MgIAu9opvQ
	(envelope-from <linux-doc+bounces-84136-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 11:15:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1A7443CF7
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 11:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99D1D3014112
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 09:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856A73C1967;
	Wed, 22 Apr 2026 09:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmrQvy9G"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2481C3C1410
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 09:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849202; cv=none; b=KO8Cm3IAP6YFbvDVq3EJrcaH7W66VvEllf8uV/PpG8Yxm3kiLi8YqU40eACgaEwKNoBvRIQ4AOtzRwKhj/CpbFYh7nQp3gVjBLlHxSx5LWHVRZKclwUN3grAdGns81zyc56G6H8gGYDQdO+tHbZjcs6/EHUaKRfRJ2h61GHW76s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849202; c=relaxed/simple;
	bh=jqGw01x33DhS5aeU49v/Mka+0a7do3a5KwJhwuhUuqk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IIHSK80nYXqhItiCOsBh/Gnzw5LTrxpspozcO5mLgTy7YvHi0nvOIOtPe2KLZucniHCf0eqPKsSQLZtIJCTJAD/v2weXtDoQi3O+I+7b+HMScVMO2aOs7/N4aBj2aWPUWqV/iiQt6fJjJYrk/72QeV4iFy0gqJepIQUTto6Kpmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmrQvy9G; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d572f7437so3440826f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 02:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776849199; x=1777453999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/otYovZDuesUe7jQPZmu+0R6E/qDznQJDykppq+S9E4=;
        b=cmrQvy9GsZpTehdjrKDddZ/pZ0/clv1D4ygYn3LOPsF7tkqfbHyX7AI+wYczsi2Ulx
         2hQ25QhoW7WVoYX8WCUDAIGiv+eQxOz4rqYo2IC+mtk5n/Ry/HgtFBtSeWPR6kTrRvgO
         a6ravUPCMXsQKUuXGgkFB56UBzDeixp4zfsSdOJgFcgTv/590a9sMUzpUDEBiyoqo8Im
         nBc7/PWHHCAp0dUzJrZQ3ITKSmOOLMtSCL8ZQgHgnw8BEYtml91IUcDHg7f48pzf6ddB
         hExCDHc4FApOLgzpTa2HGYq21E0vW8nr0RbUJvp2w3ufDh7ogg5ZfI7OV9xYCiCVkqrA
         /Gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849199; x=1777453999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/otYovZDuesUe7jQPZmu+0R6E/qDznQJDykppq+S9E4=;
        b=LvgPzLwuKuKRsA14ikufIvcvCcOWaN45KOTB42rgS05Us6UQX7CXVlvZ3knEHKzbVW
         uyUUtco7q5xdjY95tWU5sHIE2cfujOXqQJv6ahlx6IQww/8y/i/00iIFcSPyICGoZB1w
         mOO7Xmt3HiCpsbeeNu6DjIsJekn7O7RW5OnhlpBfvs2dJ+qj5wg8hM1wpAJHhz3ry84L
         LGWRByLO2VRQGCnoXiawP7sXN7mLeJPAqg0vPERADifu1NrdFEpZ78pb6gYU+GFjswKH
         4b/CP3fLMl8iyM113SijbbHh/KgnuZLZisTWjzhgAcKDFtBtIvDGS8a7IXd0mpJBiwO7
         xaOg==
X-Forwarded-Encrypted: i=1; AFNElJ+iwVsGseG/xOeJP8M1YiGvcUoTUx+bfBdeqboSgDMxN7HCokFWdiaO0sZ1eCVUArUQFe3ZM9Fk7DA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFFXIBvxhsdaIqxE1C+CtY6BWjaqiuIJ6FLtgIBahIKBA70vHM
	qFQ8vGjdM9hgGQ9Ya96mtG7tznHY/K4lbjzo8X+eJWukAFsEp/CTb75H
X-Gm-Gg: AeBDietmdA1dyzQC9Pd0VjvTfT0Te2JHemvm5YBSNRPbE0rxBb/A0M/Z+h6M99qMzx+
	/GANoXvMTlKRfZIkxW13cPDI5dDPboD+t0GXHz/Jxs0GeG/WVjI7UmBoQDOuyVuxitkEFntZAgp
	2VYUluMJ+Sd/MiBgAMsXAshh3//VvPd+jm3WBIsqo1cmjqi3i7Uj3kFPcvcR3utI4APgOIWgw1h
	TKwCJ6RaJUCgCP4PYKrxypuvx53bcuQnJm3JGkrgDy/rkuloGwqAcpF6OvGwetf/XgdRmv2R9IS
	eBCHr5jUb3AoFTGGCmxvrRWV+fEVG4FIyvGs5qv3FnSJ4S2HlgCf2iN5fFr5b5As0jBAC5+BbL+
	VHsr5+4q8kIzxoeRJwktXg4rTUU5STRql1w4AlXNv91CmuB3CiPaD1DYFm6b0XWs2LSInViWiZn
	CscgtaAxsn6cctkBPRdTePodJmaCw92l+x8Bi6w3tVuxOsz5k6YQ6SEbBA9vaIgPlAMoYZB4u1R
	fGh1Bi9GOH0ZA==
X-Received: by 2002:a05:6000:2085:b0:43c:fe66:43ec with SMTP id ffacd0b85a97d-43fe3dcbed7mr33744158f8f.14.1776849199309;
        Wed, 22 Apr 2026 02:13:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d112sm48660815f8f.29.2026.04.22.02.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 02:13:18 -0700 (PDT)
Date: Wed, 22 Apr 2026 10:13:16 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH net 00/18] Remove a number of ISA and PCMCIA Ethernet
 drivers
Message-ID: <20260422101316.0efdcf24@pumpkin>
In-Reply-To: <CAFr9PXn1ixyhD42OswoyGZ=W-O-oZygUGpRNm2dcAuYBNgtmQw@mail.gmail.com>
References: <20260421-v7-0-0-net-next-driver-removal-v1-v1-0-69517c689d1f@lunn.ch>
	<CAFr9PXn1ixyhD42OswoyGZ=W-O-oZygUGpRNm2dcAuYBNgtmQw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84136-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2D1A7443CF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 22 Apr 2026 07:03:19 +0900
Daniel Palmer <daniel@0x0f.com> wrote:

...
> Maybe we could add a special thing in the maintainers for "this is
> code only crazy people use" and have a rule to ignore untested AI
> generated patches for it? :)

Is marking them EXPERT or BROKEN enough?
(Or a similar new option.)

	David

