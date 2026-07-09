Return-Path: <linux-doc+bounces-96007-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eg5XK3jBT2qdnwIAu9opvQ
	(envelope-from <linux-doc+bounces-96007-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 17:42:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E8F7330BA
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 17:42:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IHeX7M47;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96007-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96007-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94D0E3045A85
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 15:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C1E421A18;
	Thu,  9 Jul 2026 15:42:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580C141CB31
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 15:42:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783611726; cv=none; b=dO5d2cBaCTQ6q/g1CAPx++NJTPQDJ41fAdlu0aaMWvLjoBU/+ZVHmvOH6WvecDd0/Pa29ZyXqY1gH6PSJaFZ1rN32oo7llZcHBTXqM61wJvvsbRzQa7arFF8i65feJnmQCRgxHoiDv5BkgSozI0Mog2z2Ze44t+f7EbNZNKRzhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783611726; c=relaxed/simple;
	bh=jBebvc9q65tpbTKgY3CaACwUbwDd+EIwTyXbtUWv9VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmpxdnfYmgCAV7+lTjxETge2SN48GOY5xVnj6UP5SKU7cDq1QYRR32NUsvrqMza7e5TcxjEvq1A/PB/DhB5WgLni3UZgNHx8pwQHBzZAocyxa6fwTu4tzXPmXj90DxjQOKKA2efFwbH17wE/3zZ/0DVkC/0L6YOVr7Robrpvu68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHeX7M47; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc73e322dbso19211025ad.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 08:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783611723; x=1784216523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m5WMgCSmDt8RWpA7neeShBFtGrEL8sTi9loDykIc/BY=;
        b=IHeX7M470HwInMtqFmjWjYFKB1DfkzuN8Lzu6OYbPe8fJEr+tr3TSsOvfdCeoHzJqN
         nJKIBQH7MUaanHEGKOwxZOm2mqyZRtJP5gaJzfNPoXegcnap3Fb/WXLJhCztRHBI/mIL
         MND/LotOCyG5NThW4keBM4/phNovAqcvl5jFA0NQaagF0hqrdKMyF06nLnaml/cSy79c
         Di8VbEiVWKSR0xt3SBw6qOPeYxvEZErATI1a48pdPne6YUowJlW9iw7oC5aiGdaxG5xY
         nRsr6hFORV2TKiOXSb3ggJI9YntbtZOXDk5AV1QTqV30OoaDzct2gnJETyesEERJNixb
         eXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783611723; x=1784216523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5WMgCSmDt8RWpA7neeShBFtGrEL8sTi9loDykIc/BY=;
        b=QtZmoAC7tQ9P+nn/4Iur/btjbj3Ls6n0ZnvJ69tqRRqJ4gmNBcYCtQO9Kes7rkKufe
         5xoeTiKmstq11J4YGX+S0HfV8gagbsnBsf4j2dhet53lydebOBBIk3Da5g35QBk+RDww
         oLRdO33P7xMBmiQuz2nz8ZEMShirkXNnEqUGXaumSBZEe6AHutFhwgRkDSvh0G5Eb0Zm
         LJHCmJK6hina8FC8pU34B1zSao0MxoLdGjQjPnwrom8DcOA4FQf/F6PSnNNbY0Pc8tr3
         EAv0Bem/kRh4sB00numkWMvFkWf2vp/DiJ6Pby9CZ844vWqBfAvRiVOsKkTFOxTTD2B9
         cJuA==
X-Forwarded-Encrypted: i=1; AHgh+RrvHb7Si0amT/bs6J5eyznZJ1XCkEkntCbakG/3Cx8RTDHAxSLeYd4U1Uv5Vw4ph/q0mDTonbFqpp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW5aPfGR/XyEB6eFxFZ45OWNN06dfoXXetj+6PO2W3G+sLm7VV
	kbEnBSacPI872dAAyeBPAP0RJ8Ra2rStGNetrzy/JXb7n+VkXS8GGg01
X-Gm-Gg: AfdE7ckO9QT3X3Jf/rPChTZQaSSfNyy5tW/pvdvWhl+S7BB3rYq/Z2H4bIsvrNR2OrB
	gpiDgFe4dNKTm7PKkAGz38f9JhHwlz8cMjUS5B81EFO337IyizlvldQ0cibIEnZFNk+nZW/MmLD
	c117UOZFzi79BpChz95HEBMqcaCG5FpCieIryuOQb57tCmKIhiSs2AbFnWZgg8AicprBJUzukTv
	Wm38E6ndUd1VUGuvzPUZlq+Lf6N5/cbrEXPyBPnqAmHWX5tPpXZMT4Nmclv0wss5u8xIr2AulG3
	2CvSQXkJTaTy4EyIWbuiMvZHygchaKhMa8zHHzU9RlHXtYXbEYSCqg7F+WgoMWqgZgbDeeztO5k
	+NKl+UdhNM92wYsTi+8WVrhHKZQZKIuGdVyhISeyl+nCEISmXCjbvrIj+FCNJqPtxBRVfCkaWsY
	fWrdLpJYYL+omAPyQhe2GP41Ioow==
X-Received: by 2002:a17:903:1a84:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2ccea3c7bdcmr84739185ad.14.1783611723236;
        Thu, 09 Jul 2026 08:42:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e284sm46431485ad.40.2026.07.09.08.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:42:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Jul 2026 08:42:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Fred Chen <fredchen.openbmc@gmail.com>
Cc: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>,
	Brian Chiang <chiang.brian@inventec.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	"Paller, Kim Seer" <KimSeer.Paller@analog.com>,
	Colin Huang <u8813345@gmail.com>,
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <1a7a6350-fc17-42b6-bcda-24d49725b92d@roeck-us.net>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
 <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll>
 <ak41BRQBNdsQrYww@nsa>
 <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net>
 <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <CABOy65_GqKiZLM+soZUK_34T8MYZS3dRX38-CMf_Bd1EmG0jhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABOy65_GqKiZLM+soZUK_34T8MYZS3dRX38-CMf_Bd1EmG0jhA@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96007-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fredchen.openbmc@gmail.com,m:AlexisCzezar.Torreno@analog.com,m:noname.nuno@gmail.com,m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:Jonathan.Cameron@huawei.com,m:wenswang@yeah.net,m:Frank.Li@nxp.com,m:chiang.brian@inventec.com,m:chou.cosmo@gmail.com,m:dixitparmar19@gmail.com,m:eajames@linux.ibm.com,m:apokusinski01@gmail.com,m:thorsten.blum@linux.dev,m:ashish.yadav@infineon.com,m:arif.syed@hpe.com,m:tomtsai764@gmail.com,m:abdurrahman@nexthop.ai,m:KimSeer.Paller@analog.com,m:u8813345@gmail.com,m:Yuxi.Wang@monolithicpower.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:fredchenopenbmc@gmail.com,m:nonamenuno@gmail.com,m:conor@kernel.org,m:choucosmo@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[analog.com,gmail.com,kernel.org,lwn.net,linuxfoundation.org,huawei.com,yeah.net,nxp.com,inventec.com,linux.ibm.com,linux.dev,infineon.com,hpe.com,nexthop.ai,monolithicpower.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26E8F7330BA

On Thu, Jul 09, 2026 at 03:23:55PM +0800, Fred Chen wrote:
> 
> Based on the MAX20912/16 specs on my hand, these chips do not support
> PMBUS_PHASE (0x04). Furthermore, the spec only indicates support for VID mode
> and does not provide m/b/r. Therefore, some of the features you mentioned might
> be specific to the MAX20826 series.

FWIW, phase support can be implemented in the chip driver. Other chips
such as MAX16601 don't support the standard phase command either.

> 
> Regarding enabling VOUT via GPIO, our platform handles this via the CPLD as
> part of the hardware power sequencing. Managing this pin through the driver is
> not a requirement for our system.

That would normally be the case, but if the chip mandates the use of the EN pin
the driver should support (but not mandate) it. I would not expect you to implement
it, though, if you can not test it. This functionality is critical enough that
it should be implemented and tested by someone with access to hardware using it.

Thanks,
Guenter

