Return-Path: <linux-doc+bounces-16729-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FB78CBDE6
	for <lists+linux-doc@lfdr.de>; Wed, 22 May 2024 11:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAD981C20AA5
	for <lists+linux-doc@lfdr.de>; Wed, 22 May 2024 09:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645D780630;
	Wed, 22 May 2024 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JhlQ0s5I"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8C37F489
	for <linux-doc@vger.kernel.org>; Wed, 22 May 2024 09:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716370548; cv=none; b=WF2YBwt65iYRPOE426v/WGSDiQ/d/RDHezpNCKGIuVU984B1WosRsmMSrMYX470LxbNlwGxhb5FeNP3+lmBzwQ3vaQpBtQGxiIXqWfcHNXSk+sAzegTAgFryHCPZHGox/4jzgU/9xV/fb3NcPdyRATts47ktGsVpPDVUVhkzVAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716370548; c=relaxed/simple;
	bh=fKWWwZHyL7OPIYKrmS2ydCWYIhAfOqzod1DtWaJe6xc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I4Dlfrb1sXDXATziJuEMdhMrdPxVwmIytxKlI3rlGvVf2KpiCTTZLgirWE7rl7C6YTaHPd6T7rZjf2jSp6vYBy1b5pcyBUnelrDC6BmK4miGnQ1W/zwrH4uX6mwuvlhO4ipisINQpOcIuJaPfCoHffR/dMyfzqXrsOf+YTnDs0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JhlQ0s5I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716370545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fKWWwZHyL7OPIYKrmS2ydCWYIhAfOqzod1DtWaJe6xc=;
	b=JhlQ0s5INqIVeOPheA8oSpdyA6KAKWDJes+dAcMezARbeLwoAc3k7MG/Fbai6U+Of4u6ab
	Qu4GYXVl7b6529SNcELTDH9/E6pSrJxcSSDot+7WH/GYN9D4MccsaKxhIovUuqVNujgI0U
	JWBI3ltNnDvQxwERtY3ks5c2tIZE38A=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-9u2KHSsGMXqGJ0ABeRtVkg-1; Wed, 22 May 2024 05:35:44 -0400
X-MC-Unique: 9u2KHSsGMXqGJ0ABeRtVkg-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-521996339f9so6762e87.1
        for <linux-doc@vger.kernel.org>; Wed, 22 May 2024 02:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716370542; x=1716975342;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKWWwZHyL7OPIYKrmS2ydCWYIhAfOqzod1DtWaJe6xc=;
        b=CMto9px4VaIV4cMOnkQSH5xtXpZK6m3c/VG5Y0uHJHJwS3bJpvls8OEbaUfRuAECp+
         k3jIVVxwG/puFBvq9GTCw3hyP4S50JRsNASzg1f8WQQ8uAtLhiC90WZnVg/wllQm/xMl
         BeCl54qIx4Y/KO41yf0xJff8xW20y2jk9G8GcJIN2qn5EjQBAYS/P4RWj8xtz8NliGun
         pKYnX7SbRcwpl4FqwjsHpZ8kjvhrEQXwsFi0rNFzapCNT4Vs+cZvMUgxERWfuCwXgSvq
         XeIosYluVGK3cxhnbSCGpwyAv4DEzVZvC07EZeNrzHv5CcOqisSukjxR9U/J6DleR6Jh
         6KvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGFqVMT3l2HiO+oHfD71gUfceaMhKEgrUszOBZonGe4Qz4Ovj8JkJyAZTny50MfyOGWo8sAmxf5fauiytAcL1AodDmevZ4fXaq
X-Gm-Message-State: AOJu0YzJOmn8JybihSffxdNmgZrXvEL2Ho7Nie0nymSn4jM4Nqhdkx0d
	vm/9pWMz0CrLW33EALi0UbW+2bAP22OXiPd1xagF9erW0nqxLWS1j0V2k3rQN3TxGZ1aOASRWT5
	2i2WAHL1XJxmUGNmQFJf/2Ixcu4GWWn/cdjS7QTBujYGAcL8YeJl/l2htDQ==
X-Received: by 2002:a2e:700f:0:b0:2dd:87a9:f152 with SMTP id 38308e7fff4ca-2e949586116mr8070001fa.2.1716370542573;
        Wed, 22 May 2024 02:35:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2HTK+pwJSHQe6RT9+hSS+zQYCXtVWbpT4FpQTI0Judh5rH/5iKd4AoR1TPwyCaHcaYFBNww==
X-Received: by 2002:a2e:700f:0:b0:2dd:87a9:f152 with SMTP id 38308e7fff4ca-2e949586116mr8069771fa.2.1716370541151;
        Wed, 22 May 2024 02:35:41 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b094:ab10::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccbe8f74sm495149265e9.8.2024.05.22.02.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 02:35:40 -0700 (PDT)
Message-ID: <8945a5ae3f94572daae42d4bfdc326bcf0889964.camel@redhat.com>
Subject: Re: [PATCH net 0/3] doc: mptcp: new general doc and fixes
From: Paolo Abeni <pabeni@redhat.com>
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, mptcp@lists.linux.dev, 
 Mat Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>,  Gregory Detal <gregory.detal@gmail.com>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 22 May 2024 11:35:39 +0200
In-Reply-To: <20240520-upstream-net-20240520-mptcp-doc-v1-0-e3ad294382cb@kernel.org>
References: 
	<20240520-upstream-net-20240520-mptcp-doc-v1-0-e3ad294382cb@kernel.org>
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

Hi,

On Mon, 2024-05-20 at 10:16 +0200, Matthieu Baerts (NGI0) wrote:
> A general documentation about MPTCP was missing since its introduction
> in v5.6. The last patch adds a new 'mptcp' page in the 'networking'
> documentation.
>=20
> The first patch is a fix for a missing sysctl entry introduced in v6.10
> rc0, and the second one reorder the sysctl entries.
>=20
> These patches can be applied without conflicts on top of the 'net' tree
> and the 'docs-next' one. They are currently based on top of the current
> 'net' tree because the first patch is a fix for a patch that is not in
> 'docs-next' yet.
>=20
> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>

These patches are IMHO net-next material. If you don't mind I'll defer
them.

Thanks,

Paolo


