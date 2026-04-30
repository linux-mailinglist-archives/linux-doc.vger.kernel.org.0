Return-Path: <linux-doc+bounces-85330-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIAGKbmO82kQ5AEAu9opvQ
	(envelope-from <linux-doc+bounces-85330-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 19:17:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D234A641B
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 19:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AFBC9300F4DC
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 17:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE5E43D515;
	Thu, 30 Apr 2026 17:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTrZJCsU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CC8401498
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 17:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777569463; cv=none; b=J+jD/xQ4f/vEA3cX1N1zAOGdSOLdS/bPvWXOzqP1scJOJTmndAwLO/DF7ADjvA6VMYhQ2jlO8QB9Tq3ZdrDbo6INQuq2XodqOwGTnh5sOUbe8lKfT9VvLsQPB5gHF4G4H/pRd/jiS/yrhkw7rZc+XM0R1Aa2s1nAvvaZAVAwsWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777569463; c=relaxed/simple;
	bh=CdGifpXTjb+spzLE+zLsBL2Sw5L7SU7MRgG9SEVCaSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N36xYQZvR3SNaSisLkgBgQ+EqYKmfThBddoudgr14fcPYEs42ChA/54D5zDTDpfDdSNNb6fomtAhtyYjS9ppUZdFYQKVNCsZ7i5hh2vI9eQnEdHHn+uuOodUB5lXTxH9pFT7gPp5fu0oM0jkUQqCsryIQAJYQMMyVv2PeUKXVks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTrZJCsU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b788a98557so10111895ad.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 10:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777569461; x=1778174261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxTEotuK8mpwbrGLCcn25pmcSWTLgELt4EA9ZD/huhU=;
        b=CTrZJCsUQxXR8ZwX0xfPVU5Rz3CYTlqHlin7fOL9I5UmPflRaVPlsYRFqhctZYeUv7
         1xjM0R56h9wBPxcIJlI6JYBKitsOqNP+mMp6th7ZVJ+YHAN5Co9utnTkvr6aSaenYo8/
         F4h6qSlwUtIH6N4SMCN2ank9eI0nifLrA68fE+G2bS5FiViTG+mVDl6rOklul7uNuk2s
         RZN8a0e2wl2fuC2IZD9hyKN2DCuJn/EeDMsQdlVpeR7bwyQTI/JokEHD2YScXSWDWwSN
         NmjghzxJOrJ0ll800/Hl3RYq8UwJMIzISW4KFO/wzO5bLIbUMGDItHIrLbSVJlLB4uGv
         C7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777569461; x=1778174261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RxTEotuK8mpwbrGLCcn25pmcSWTLgELt4EA9ZD/huhU=;
        b=e04atHvr3b90TteiCWmyHsdEH9Q1fdcMJZHhAXzoP+4FJDXBeJ444FKh3LcON2F6RZ
         N6bpzbdPawbyF+TNtl8qtSOs+ZUUd5Oj6T7NOTzL9YNtvcWD0WQkrAonpJH+ktqHsPjT
         oLrHPK8erBUfxPXEB25arE+pDIuqH/6kI+hzb8cypL6/i8Ryum1t8cNoiL3+otvDpNMU
         gxKWI8uutH8+LdrLnHcD8amh5vvTFqp9ThN5ZbIigxqMb9mFN0drrndsfXabXd+AvUgl
         PNFcuySLGZP/SX/oTuYiBgVMYsKgM6Ke8Dxv2x9uIBEiLlF9kEnFk39D0JomfO2bGOOL
         kLBA==
X-Forwarded-Encrypted: i=1; AFNElJ+vfm1yFAVQB8hXDw0lpbCW3N3BdTICs+RVKwBBEV2vWZ19heSuTQr/GGbH6aOcYJNfVO+qFyHxWis=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7dNyVbp0LL1tgZBdggJd/B0L7ke8H1VThJC1XAdJf/d7+WDRK
	NXjS3bo46v/vtTByWRbtafHKE93o1JY/dH3nc/LyRpQ3ZabYrGedeVPP
X-Gm-Gg: AeBDiesHVHYrwsxeSgvOLGA1HcZbGur0V3zPUUxk5q27J23lsiOKa6g/GLIUjrSz92d
	gYY1gTT8jP4sdOz0VYPei944NH2LFiIPB7ebT7zjsVA69ryKkDAYkXa1K9E8GzozIohXStNYZ9U
	6xegzgxWAHWFtjOKu5BSVq6YM1C3RRAX8E/IybM5OmlUWqvyaJQcaeuq9e/U4pGtsDJ/4+EpNuH
	+0m6u0GuHItfNUCgkWZjg797svCIHCdCUcva6cYh8T+gK702bBuPCt7b5unqELV7LAPwCjkSfsu
	M7SFJnJuwlUfo4yBX1rpIgoyA/x71j9jKpTmGJI9avA0uPigJdzl17RaaAMhxFCvwXW03jlGe/A
	kMFTlqhcSuoXVXuxuY4vpL/RxJdkBEfDlSTy7EI7AtfxwUhk9rAAj9c/nTkT2A4H+PBOi7sr4rw
	PcTUaTnVCa//TGVBitdN0tgHzBXauiYrkVuYckzDCQ/rgt6Qk=
X-Received: by 2002:a17:902:ea0a:b0:2b2:53f5:463c with SMTP id d9443c01a7336-2b9a23199edmr42138745ad.4.1777569461529;
        Thu, 30 Apr 2026 10:17:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caac6e7asm1903835ad.30.2026.04.30.10.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:17:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 10:17:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add MPS mp2985
Message-ID: <0967f7dc-f65d-4a02-8816-65b97847f406@roeck-us.net>
References: <20260414092801.1067470-1-wenswang@yeah.net>
 <20260414092921.1067735-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414092921.1067735-1-wenswang@yeah.net>
X-Rspamd-Queue-Id: 57D234A641B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-85330-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FREEMAIL_TO(0.00)[yeah.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]

On Tue, Apr 14, 2026 at 05:29:20PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mp2985 controller.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Applied.

Thanks,
Guenter

