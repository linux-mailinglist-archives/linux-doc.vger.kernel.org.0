Return-Path: <linux-doc+bounces-91275-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yuPUBYkdJmrWSQIAu9opvQ
	(envelope-from <linux-doc+bounces-91275-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 03:40:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 737BE6521E1
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 03:40:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=b8wMrTh2;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91275-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91275-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AE9D3005E93
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 01:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290A02EA151;
	Mon,  8 Jun 2026 01:40:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098284071CF
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 01:40:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780882821; cv=none; b=DB2MRDuP6G3wDtba4bJHyKj0P4iE+VcuZZKlqHagVHYg3hpYRDXUZ7dIfcMkVDImHmKpFDFQ7Y0qKpY2XkfUAjWSwMmJTrAL4U8onFbesK+yLGbfQMX9pTIHiOrmsTSmI1PHWky2NNIgyVelYcwZCBuPJlcpUryb5pM5W+89z5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780882821; c=relaxed/simple;
	bh=L5dCiZ7Z76aJT65i7zCUOY/qCp2HbdKHRdXEafRjYp0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=RTf6fQilcFdqLi2Y6rkbHWbzfLpha+BLVdkWKiZEKHKF7jQkiEM9q2EF0YGkaDO21niPu4PmUbG2EWczzj6dAy20Kz6ht4Cl0jV3UteoouGfbCM1Tos8jXfDB6Hl1EoSCDMPdECBPOtckXG/W8ynu85sKhKkvo8NhenVOzDyHWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8wMrTh2; arc=none smtp.client-ip=209.85.210.182
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-842cd900ee0so434536b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 18:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780882819; x=1781487619; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5dCiZ7Z76aJT65i7zCUOY/qCp2HbdKHRdXEafRjYp0=;
        b=b8wMrTh2neugdH7O/CHBd8SZXNhGrNJhMCmnUf0c45nFlhWUfGttTE+FJIJO43gMC/
         XpLVUSclQi4IRYcFEM+j1ROsHSCpw3iGxcNo3s0OT/GVh3KaGwEVZo+0aVgGxmgH+wpO
         cP/tGE4FcZLBLr7wPH4HJfa2DEHV8gvmquJy1+7HEYNf8HkYE8gkLWMum86VrBtqgAku
         IobqsxOl8vkdRXKT4oR4Rsfy4SnKb5M6e69VWQ0PFakMcMQDK/oTmACVVJwXRHkgEKIG
         +q+k2+YrCDK0x3WTmBU2SEqlPJo06fqz0GQOJaCDOWhRgcZoK684BAfpoRqK30V8Hzoj
         D1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780882819; x=1781487619;
        h=content-transfer-encoding:in-reply-to:content-language:from:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5dCiZ7Z76aJT65i7zCUOY/qCp2HbdKHRdXEafRjYp0=;
        b=O6h5+XHSOhoaepst1I6C9jENMQv5tXAu6Qk1qCL6qhBwyl2GUTBQepDcrAUEN38ltM
         dQqZtxWIQV42ydqFcXZuceT8vhZxceuIx8qWZu+TXxjOAjvLvA9ZPVwchouNfobu1DCV
         V7n3PAXv1bEVKpcq+5qHx3cYdAqbC8A72fet5S7ni2EIR0e7wE8rCLPfxaKMurQ+aFfC
         iQQQkvxoka/ZqNIaKyMI/zRBVKsjmF+hNcMqJcyFtRM9edl1VWQ33dRowxf6ncfS2YT0
         wb1MIVArVPoSn897L/XC00TwwCvNRvS5/pm/1OUsu/I445pmMDJtABPNN4etZEsqKluT
         9bRw==
X-Forwarded-Encrypted: i=1; AFNElJ9Ct/o0PeaqpwaQqo2+uqQHdoFso/RMQFUwMIDfLLWVvUhoDxpYXZMxSf814UG4IT9MI0Co+Wfc2lg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUYxnCXbEjpRLaD14iNU6fdFj+RhpkQyRPCKle+zOvQFl85LFB
	26BG2sXJ2OR9T3jk2Zef5zrECKS4pS/fMNvL9u9ulkEmqqVvQlTOFXwi
X-Gm-Gg: Acq92OEfTmGu7VQkB1qmzjJxj5ww1lnFma8FskyMEtBGAFjNCcOEkkAdsewyLzeBIjN
	19nHIdH8DWjCrLyiI9d7/LwPd7nIHEvA2YMU/z675pJgVgXp0FneeHGJwni1nYUevINBWQjWcZg
	P6Vwqfzpo9XmFdUbh5dNO8Ye5OP5nuWM0fXzvEmRja0YNTvb7OLOQ14VVPXW+gIfYSx9UZcZ8lz
	twnvfU4YwXygR0LUvQhgkzmsOJzErQIUkFmiPS/E8CeJ4GTv6/8owiogoA9HtN86PnET/78qH3e
	oO25dFv29ihk/MzwNCiczP1tRftekIlesC25PnqMhg26R0As/ffnN20BMJDh6NLLGbAnoTkUfiQ
	gwbHcZllrW7v1CYMFdZX9rv02qP191qgGv/K/BfVIH2l6uJiNsg4GB6ojrccQ+NwdVAsfqODFGr
	N6g0+V1zRVKKZq5VIENTsh8fQhXddlN4K7WeFjGJsMCkQ2FXRY6YZzQVDUbmlZD2yRmdNLi61S
X-Received: by 2002:a05:6a00:1804:b0:842:7992:bdd3 with SMTP id d2e1a72fcca58-842b0ead88bmr13822040b3a.4.1780882819355;
        Sun, 07 Jun 2026 18:40:19 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:2f00:bae2:daf9:9217:a5c? ([240e:38b:e68:2f00:bae2:daf9:9217:a5c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428325d9a3sm15939190b3a.34.2026.06.07.18.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 18:40:18 -0700 (PDT)
Message-ID: <b7606f72-eb55-41a7-b685-00164050e159@gmail.com>
Date: Mon, 8 Jun 2026 09:40:11 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dzm91@hust.edu.cn
Cc: alexs@kernel.org, corbet@lwn.net, frederic@kernel.org,
 gpiccoli@igalia.com, jani.nikula@intel.com, kees@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, longman@redhat.com,
 mchehab+huawei@kernel.org, si.yanteng@linux.dev, skhan@linuxfoundation.org,
 tony.luck@intel.com, zhuyan2015@qq.com
References: <4534170c-700d-43b5-ad32-6b91455b3f14@hust.edu.cn>
Subject: Re: [PATCH v2] docs/zh_CN: update admin-guide/index.rst translation
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <4534170c-700d-43b5-ad32-6b91455b3f14@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,igalia.com,intel.com,vger.kernel.org,redhat.com,linux.dev,linuxfoundation.org,qq.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[seakeel@gmail.com,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-91275-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dzm91@hust.edu.cn,m:alexs@kernel.org,m:corbet@lwn.net,m:frederic@kernel.org,m:gpiccoli@igalia.com,m:jani.nikula@intel.com,m:kees@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:longman@redhat.com,m:mchehab+huawei@kernel.org,m:si.yanteng@linux.dev,m:skhan@linuxfoundation.org,m:tony.luck@intel.com,m:zhuyan2015@qq.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seakeel@gmail.com,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	SINGLE_SHORT_PART(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 737BE6521E1

Applied, Thanks!

