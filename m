Return-Path: <linux-doc+bounces-57063-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF94AB2F39F
	for <lists+linux-doc@lfdr.de>; Thu, 21 Aug 2025 11:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E41F5E82BA
	for <lists+linux-doc@lfdr.de>; Thu, 21 Aug 2025 09:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39AA4214811;
	Thu, 21 Aug 2025 09:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TPmTz98N"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0332DFA38
	for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755767685; cv=none; b=bGO4ZG7ZyaVQe+7s02MtsYVMZaxWMZrecgVW6KOfFzgUHgfcMqiQ3qEPpGKuOKxyzzjgwtBGLZi9uhthBlHS+fOFDlcvPxgpxKbQY4RVYFt2JCtancrCA0XAFgmGdIQZa6ZChhKDfoEENkLDlKOrE0w8Uyrd24qkBYuA71eZ31Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755767685; c=relaxed/simple;
	bh=1ewMSBBg9cmq1Asjak1aE7nAcBgixBHay9BTXHvKZ8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtFmdb/XTFuqCR1m6sBM/RaIDWNXEEL1nZ7ChcpuyQfkZLrhRFNgBwTDAAOjn0qJGvdKJET+2ppAyhgz5jaMauziWEHgvJEplswehmwEv83bs/JUgP+N+geLLtXYaflfTXFgVMbmFuh1+zmhGLtqoHfoJvVe6z+ueYisnY3innI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TPmTz98N; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755767682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d/cls12ySWE3NAa48m4sMHEPJFNdbq2Fp43VAzgYuEY=;
	b=TPmTz98NyWIBT4cp0ZJBrTe/4chifDMw8jb1Sa4djuLZ5/waJb+/Kf8Q29VojSkQsazdn6
	wTJNpCE21iZFNxAbx4C5ZxoIMCACSFfe14QQ/CQ07pi7kNr+GFNOvz70I8wtDzhHU7flqj
	h4TrisJlEr4BMNMFZQ7cSjXjtmMtmdo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-B3vByokkN_W89TD7RCi-Ow-1; Thu, 21 Aug 2025 05:14:40 -0400
X-MC-Unique: B3vByokkN_W89TD7RCi-Ow-1
X-Mimecast-MFC-AGG-ID: B3vByokkN_W89TD7RCi-Ow_1755767680
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e870662c1dso192747685a.2
        for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 02:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755767680; x=1756372480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d/cls12ySWE3NAa48m4sMHEPJFNdbq2Fp43VAzgYuEY=;
        b=tCHs3ezuA9Sw6memrbivYFhoHJ7ryowhveBYrbb+kGYd3nzEdxp85JIDhyVRDhz7Hy
         6W/mU6jsfccOTLXmhONBZb9BY+BYSpyAWHP3sTxL45BX6Dp2rYVGVGbHeSB1S03MJ2E7
         wATx4Zf9dSIFXezEVOSd/9FRWK/mTtoq+xnV0QkYxgEzdCsZEanAo1lj4V8gX+sGuXMY
         7tEoR6mW2G20GQHpF71kGvHP4ZnOv5VJ7T8nZJbmfjlhTUIFNFOFr5gaoQzroFfyYWmK
         mTi/0REIuRMIGl88iG8OeIrYF8fiiKIbP3Qbe2l9AMamsOZquRt+s8xkzD1KeQxaTjWa
         asww==
X-Forwarded-Encrypted: i=1; AJvYcCV3bya4zJWEBRWr8fX1V1F2VZeQrde44Lyp3E7vZO6eUdoxc3XpgcwRLz/varQ9sRjFiErD+skt/Ls=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfPtX/X/xy4YkrPkvi4wkMy8e3lzz01H0+KsogtUu9itjkf90o
	Z8fpnoCs5e7H5pXa/QAmrDByj4iUzP/bP2YDqv61r1cLdlUZ/B9S5CLBDJzAYzegM1rVUfw61sE
	1wBJYe1hPf1D7yvQTyOxQft0/JHq1MXvf/PDAXkQLwCtdu/uLjvwww1z7EKonmQ==
X-Gm-Gg: ASbGnctza0d6djrmMdAilJZ/BZdvJ6wXJSZyWfPrTcSUexAhS6SCVzZYzUGg2dq319f
	WDtcI1/GFTibP3KqLrskf7RQszYhzTa0gDVRYOH8Oszvxwn6F0b7fhDXrHH3qeFy5h68nP8JiuY
	p/8/2baJ3bDRths7otvz0f+PyHe3UhoktLOfiacGQ73cXHyxoG4vlJS5X8dpVoSmdrczJUM6ldL
	7OHPFtcYxynY5L1VzEL3xQpwfaQX2uxrmrXOisVsxXf//3KrIuvVOek01XM9BG/iSrmMn8IoHYo
	ivqYoz6zYY6AZGuytD8cD4g6QqMBlGUNGKDgcNSrKfJcul/WH4yqH8ErvkUv6x4YV180MWxy/N1
	ZWAqxm049wsY=
X-Received: by 2002:a05:620a:31a9:b0:7e8:7eee:7d66 with SMTP id af79cd13be357-7ea08e3ecedmr181781785a.40.1755767679887;
        Thu, 21 Aug 2025 02:14:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ0c/CeAt2mU1zijFZ8Xtf8yg68lytCTDkdCZS7E9eYRtoLIMsMFMlh4Pv2bSyDJHFqzlT3w==
X-Received: by 2002:a05:620a:31a9:b0:7e8:7eee:7d66 with SMTP id af79cd13be357-7ea08e3ecedmr181778085a.40.1755767679305;
        Thu, 21 Aug 2025 02:14:39 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e04abd8sm1085524985a.18.2025.08.21.02.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 02:14:38 -0700 (PDT)
Message-ID: <ea44c100-34fc-4dec-a749-454d224fa84e@redhat.com>
Date: Thu, 21 Aug 2025 11:14:34 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 net-next 3/3] selftests: bonding: add test for LACP
 actor port priority
To: Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Petr Machata <petrm@nvidia.com>,
 Amit Cohen <amcohen@nvidia.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 David Ahern <dsahern@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20250818092311.383181-1-liuhangbin@gmail.com>
 <20250818092311.383181-4-liuhangbin@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250818092311.383181-4-liuhangbin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/18/25 11:23 AM, Hangbin Liu wrote:
> +# Trigger link state change to reselect the aggregator
> +ip -n "${c_ns}" link set eth1 down
> +sleep 1
> +ip -n "${c_ns}" link set eth1 up
> +# the active agg should be connect to switch
> +bond_agg_id=$(cmd_jq "ip -n ${c_ns} -d -j link show bond0" ".[].linkinfo.info_data.ad_info.aggregator")
> +eth0_agg_id=$(cmd_jq "ip -n ${c_ns} -d -j link show eth0" ".[].linkinfo.info_slave_data.ad_aggregator_id")
> +[ "${bond_agg_id}" -ne "${eth0_agg_id}" ] && RET=1

A few lines above exceed 100 chars, it would be better to wrap them

> +log_test "bond 802.3ad" "actor_port_prio select"
> +
> +# Change the actor port prio and re-test
> +ip -n "${c_ns}" link set eth0 type bond_slave actor_port_prio 10
> +ip -n "${c_ns}" link set eth2 type bond_slave actor_port_prio 1000
> +# Trigger link state change to reselect the aggregator
> +ip -n "${c_ns}" link set eth1 down
> +sleep 1
> +ip -n "${c_ns}" link set eth1 up
> +# now the active agg should be connect to backup switch
> +bond_agg_id=$(cmd_jq "ip -n ${c_ns} -d -j link show bond0" ".[].linkinfo.info_data.ad_info.aggregator")
> +eth2_agg_id=$(cmd_jq "ip -n ${c_ns} -d -j link show eth2" ".[].linkinfo.info_slave_data.ad_aggregator_id")
> +# shellcheck disable=SC2034
> +if [ "${bond_agg_id}" -ne "${eth2_agg_id}" ]; then
> +	RET=1
> +fi
> +log_test "bond 802.3ad" "actor_port_prio switch"

The test above is basically the same of the previous one, with a
slightly different style, it would be better to factor the whole
status cycling, data fetching and comparison in an helper to avoid code
duplication and the mentioned confusing difference.

Thanks,

Paolo


