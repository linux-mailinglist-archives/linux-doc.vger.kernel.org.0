Return-Path: <linux-doc+bounces-94075-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KfT7OUXaQmqPEwoAu9opvQ
	(envelope-from <linux-doc+bounces-94075-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 22:49:09 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AB96DEB5F
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 22:49:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LbQktx23;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94075-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94075-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 764A2303583F
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 20:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA2038B7A5;
	Mon, 29 Jun 2026 20:49:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6761E38239A
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 20:49:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766144; cv=none; b=sPfTGR/nSEQCgxbCUqYifVmMzHIA9/iE6e1Xn+FYB/msq72dABJf2Gyjc2uNoYHuIafsObPHURdqOWc9C9Ma+PZhXLCT39NbEnfKybxjyboyCzaYW3v//fynnIvuuER8SW/dRfLo52c2tpHrZ8I26+Qx6eL+pEjExcvYuqpNRJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766144; c=relaxed/simple;
	bh=rwJU3WYOnqf0gEpLs11o/YLJOMO9LRJt51RJ0YywOlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppFVD1DuRWutCHDkzKAuG9Pgwzv+VHz7KrDDocibSi1f7IJPm9+5AUVa6xUE4bGK6Zpotc+lU8+UpiQ8y6cyjeJzn0LY8+7EYwjaFWi6of0/gzPLQnWc2Y5vxKb6KUxbTWVSPgJZVicbccUz5wTVJOE7O7zU/uz7AnDGPzosYxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbQktx23; arc=none smtp.client-ip=74.125.82.54
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-13b24ddadedso1350871c88.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 13:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782766142; x=1783370942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPnhh7jgS4UPbJkDdwhyat1goHs+cg4UMrEmlJGrCmA=;
        b=LbQktx235j+Y5OYmup4u3Cn8q4Q6rwY2SfV1EZ2sR8+7BlE2O7MasBNZwNppLTRrZ6
         kB+gAv3QflpBskQAppLEVLQ/goPR1D7GVzVBq+9HdNUrRDlW+4E/0SO8f+W1FjG1FCEI
         9h20RRqd3KTNxeKkbTu/QX8yC3MRC8Q36OWLDv45JqEUGlJp8tPO87J+cJR8wPJA9AEw
         O4JpS6ym3fMo/xrbac4Zi0z4nzrR9jnGhaUeDdveNP4ecL65ZZwlXu+W9xkfEIpLk1uO
         qWI04QhxgmsOMGszFNCgqwIABvTY4UHhSShIl0X1XKTzLxEgUvgW8j3o6J8IuTwyklA2
         bVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782766142; x=1783370942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hPnhh7jgS4UPbJkDdwhyat1goHs+cg4UMrEmlJGrCmA=;
        b=CZ2PEC1Qlp8PG8SwYbKK7cbzXz+VX/NrjCpz9ldgNHSEiiBZC6e5l21YBqMxqak8iF
         P1b7a8vdJImOqhTeoSFkSBLqWZ/z3rfKBgHgK+BKTfncvKMfchsTE0GqZzQgDom5llWt
         OpJksybL5NIsUo9VvH40wxU82rOHxlsa/Z0qbciVwAnjCkJHRaIDOTccJAWOZKkOPBR4
         +94wsenzg1Gd2p8JObk7Y8zVjrfEi23qdVoqZJDOVSjyvAOMW+YXRIMxbk8f7nYNMEbJ
         aH1mVQvuxPfoKQCyTMHWVLbtyvVLx2DUgB8GDA1QoldAUhZRyQCfjiKkz6OIDx2KZZVT
         vn3A==
X-Forwarded-Encrypted: i=1; AFNElJ+EAHiGOarXpWpq3jAuYPVko4054caRkd2sQ3U/qi1nnCIH05CBwrRyQYFkAJTIQXiTHdbwZ22WwiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVnR0kkXOJbjM0DnpL/ehowvt46Nt5TPzSSFxI0nrQg4exNyQu
	1cDy9Zb8L5g7ttyRuvJMp8EVSgiP7XedZJdyv9w7B7cN+Ez+AKrw5ZlS
X-Gm-Gg: AfdE7cnSQ4hWVOZUMPx4DE47TtsE6zC9JHnXGEb6is7k3/Dqs9JbkOG0vMIZOPwV4HS
	NvZXvblNf1Kq1o1rZmg5bdNM1TgKNMM/bBA/RBUB+mu5AKvD3tnNJ3SSFCSp9Jzs/wxXOkYDuCP
	emUE0ivY3cUG+cJfSRl59ii3pgYUtHGwglszbwiCAvRAfIqUSgKQZbqJkcjmrMn6mU29Uelkouv
	8tRbeXAcJaftphSMwOimWHyxU9vsH7YtftKdsRsnkBMLmrPwRdXQZOc+XJ0VzrazzfTi3wuOmHM
	lLBNDs/Iobglqt7vp0bCkBkJLeqwd85vbX2/6KE13xenvl+s/kuJQ1f52m8PJHQhJZHlm4rfBoZ
	zgnaTL59nD/W5rtXeMjT6eY8ECPDFOVc/AlBe1HRjwMbSOWwIEGgROor5OBU70yqTtqL4T4nRhk
	/UfE8t96lVjcXtag5Y19o48e8KQw==
X-Received: by 2002:a05:7022:ea30:b0:139:ba7d:84a7 with SMTP id a92af1059eb24-13b2a1665b5mr614140c88.13.1782766142434;
        Mon, 29 Jun 2026 13:49:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab0fc3fsm1198786c88.2.2026.06.29.13.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:49:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:49:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 4/9] hwmon: adm1275: Support module auto-loading
Message-ID: <87afc89f-f87d-4d83-9b14-1d34af73181a@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <9eca6831f9fe2d781bb88337397c39b10e36f5c6.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9eca6831f9fe2d781bb88337397c39b10e36f5c6.1782458224.git.mazziesaccount@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94075-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:wenswang@yeah.net,m:ashish.yadav@infineon.com,m:vasileios.amoiridis@cern.ch,m:kimseer.paller@analog.com,m:tomtsai764@gmail.com,m:chris.packham@alliedtelesis.co.nz,m:robert.coulson@ericsson.com,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[fi.rohmeurope.com,linux.dev,kernel.org,lwn.net,linuxfoundation.org,yeah.net,infineon.com,cern.ch,analog.com,gmail.com,alliedtelesis.co.nz,ericsson.com,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,roeck-us.net:mid,roeck-us.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89AB96DEB5F

On Fri, Jun 26, 2026 at 10:24:21AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Populating the i2c_device_id -table is not enough to make the
> driver module automatically load when device-tree node for the
> power-monitor is parsed at boot.
> 
> Adding the of_device_id tables causes the driver module to be
> automatically load at boot. Testing has been done with rather old Debian
> system.
> 
> When inspecting the generated module-aliases with the insmod, following
> entries seem to be the difference:
> 
> alias:          of:N*T*Cadi,adm1075C*
> alias:          of:N*T*Cadi,adm1075
> 
> I suspect these are required for the module loading to work.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Applied.

Thanks,
Guenter

