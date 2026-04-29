Return-Path: <linux-doc+bounces-85139-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GE5uHMXH8WnnkQEAu9opvQ
	(envelope-from <linux-doc+bounces-85139-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 29 Apr 2026 10:56:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D064916B2
	for <lists+linux-doc@lfdr.de>; Wed, 29 Apr 2026 10:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EBAF3053DE1
	for <lists+linux-doc@lfdr.de>; Wed, 29 Apr 2026 08:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CC83B38A7;
	Wed, 29 Apr 2026 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="lpLF3T7i"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F20388E5C
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777452936; cv=none; b=jt74s9Bk6u/MXYXGMqK0YpGBpI9jrdum17Kxu54/xqs/FtxlTaSFG+3D2Pl2x+xHyEN+VxOzD/DJWLUkUANWNV7e+9m66ZZON5AHifq9alu0tDES0Ags6Rdv5ueciheOtz9XfMSQEwnhXGQ6/WYsXPfprZwtQubd7QOOEMXvlwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777452936; c=relaxed/simple;
	bh=zloadYk+FRxuCKY1pGkNPmHK8KQ4PABu8yyLAufBvZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N91jwDYhTXwv/9jYGe3ZT2/8tX7Vy3uhkuJzPeMCGUHZ+cXU9KD4EQocXxDdkrni3uU1mguiT01sHa4plJzz/bTcRsHB65dt5YIXptc+IkzU+T4/7oy9H/OVYhPSHesnH75FCpUKBxZnEoaKauDZ88ydtczQFOg3+IAnqkgJOx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=lpLF3T7i; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-448528f4e69so119637f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 01:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1777452931; x=1778057731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nt4otsNZP+qM1RAgOCDcWAVXVHOwNcuga4GcWRLPXg4=;
        b=lpLF3T7i9Y/ZHbWCAqHJ+CGOhS9l6q/j5ghgUJQbOHiwie31KWrOUMLpFxkqPE1xUv
         97tZ0lndsgCxAflKz+tsV4PYoEG1a/Ru0g48wScK2vAgvghUzHgyWmR9wHbpYRgXne4W
         XKw6GyNFQRJUn7AZvMHJQmnUg7lW7YIN1F54YKMOWyV9HfinnwvkWyeiLYntrFEdcYR2
         atIrgFuumMTxRSxBcaN42QkiOE8SJidAwBJCWSrwJzpofAAYxEDUG4kKhmP9x2BgML97
         7ncCjHEBOGbfYsuagML107m0gAXY1Ge5OlCRBOqVlxy7RWWxTUvKBwiDqUjqiTCptuXs
         10Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777452931; x=1778057731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nt4otsNZP+qM1RAgOCDcWAVXVHOwNcuga4GcWRLPXg4=;
        b=qVku3dVUNEIv2jNCFOjt+ecDDa6Lj1g9i07EQbx65ma8CCwOEwiA/EeXCKFMt9NM9e
         AfD5xA5eUJilKrus7ssWc9PU9aiEAaQsDM1NqJSv3lxo8/95E63wpXLKZe2kQt+2rOZ1
         4la0nKzSclyCYA4Aw45lMI6dnwRV5lnQfWKpr36zx/4uaRoTM2wYgg3GtbpqylIM2+FG
         rN00oVXX9cPB09JHCZymz7RBEfYUw7KPJTVHF7a5MhlgcDEPJ40W1vd1kepFLmRHgo3g
         JXctT/fN/VQzVL4ohcdLsV/sbXPsRmYwcuLyHToQ57cTH51WpIc7PvfkSMF8mcCySjWk
         fehA==
X-Forwarded-Encrypted: i=1; AFNElJ9wD6NdiSG4MoSE7F+BFAGKh4Fo7v6gn2aQqVST9baVhJnAe3mNs25Jk1B5PcVrtultFhpdQQaP66E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Zhltv795gfTN8RVHtnBOSGJSsIjqp22YDmUYnzpLmHpd/prc
	iuZBdlOQ3TSwCuprIcpKaGcFT5lc2Ujc5zinKJ7Q35jANY4ly2XLVe0c36XQyePJVqQ=
X-Gm-Gg: AeBDieuv+95x4CIlqF2tKO7FXlwDkPnjwkl5kEv6ziwn2SUIuSkl7Nbu/n1SQyMkeFl
	xQP2oQiXd48j05EJ2+xTNwztq2thZ0P1tXackYnquQyY9yguP+/V+ChwXB9Mlpsif08BSIBwY9n
	sqiIz7MGMsyocGUdbP90TJEbSnh4maqa1TV7XlXNPeov/aIRZPrubnveLNfR/l0wlWj27cjSOOa
	L3G1EQM/cUW1fapZu1DBJhtfR+6g39xz94gF51dgubMJtTQZ4fNJR1Xk+zjVewoWLUBaaDyDYYH
	CPpusdF3yNHf02YGTsZnqXxksFJTtQlDSutQE8t/azLydHX1sOUHLjorLzP3BPCS6QBFrDmg4Xe
	sE1tIOzI+FCJjFjn9E+e8ybiiNsDhu1f5yODejo+eCM4pd6luykeE0FJzHhGnk6uKdCkGEVGjb3
	0xl/QifBrwuyvoGcRhSlKGrv4ZH91RhBQtLl58yhL1fA==
X-Received: by 2002:a5d:5d11:0:b0:43e:b0f7:9ce9 with SMTP id ffacd0b85a97d-44647dd17c1mr11721926f8f.14.1777452931178;
        Wed, 29 Apr 2026 01:55:31 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7218622sm4257094f8f.21.2026.04.29.01.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:55:30 -0700 (PDT)
Date: Wed, 29 Apr 2026 10:55:27 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Michal Schmidt <mschmidt@redhat.com>, Paolo Abeni <pabeni@redhat.com>, 
	Pasi Vaananen <pvaanane@redhat.com>, Petr Oros <poros@redhat.com>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Simon Horman <horms@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] dpll: add pin operational state
Message-ID: <afHHb6UmK73yRXs-@FV6GYCPJ69>
References: <20260428154907.2820654-1-ivecera@redhat.com>
 <20260428154907.2820654-2-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428154907.2820654-2-ivecera@redhat.com>
X-Rspamd-Queue-Id: B6D064916B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85139-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,davemloft.net,gmail.com,google.com,kernel.org,lwn.net,redhat.com,microchip.com,linuxfoundation.org,linux.dev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[resnulli-us.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]

Tue, Apr 28, 2026 at 05:49:06PM +0200, ivecera@redhat.com wrote:
>Add pin-operstate enum and operstate_on_dpll_get callback to report
>the actual hardware status of a pin with respect to its parent DPLL
>device. Unlike pin-state (which reflects administrative intent set
>by the user), operstate reflects what the hardware is actually doing.
>
>Defined operational states:
>  - active: pin is qualified and actively used by the DPLL
>  - standby: pin is qualified but not actively used by the DPLL
>  - no-signal: pin does not have a valid signal
>  - qual-failed: pin signal failed qualification
>
>The operstate is reported inside the pin-parent-device nested
>attribute alongside the existing state and phase-offset attributes.
>
>Signed-off-by: Ivan Vecera <ivecera@redhat.com>

Looks great.

Reviewed-by: Jiri Pirko <jiri@nvidia.com>

Thanks!

