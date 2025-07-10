Return-Path: <linux-doc+bounces-52707-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CECB0034F
	for <lists+linux-doc@lfdr.de>; Thu, 10 Jul 2025 15:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 744DA3BC316
	for <lists+linux-doc@lfdr.de>; Thu, 10 Jul 2025 13:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A07235047;
	Thu, 10 Jul 2025 13:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BQe2G3v1"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612048460
	for <linux-doc@vger.kernel.org>; Thu, 10 Jul 2025 13:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752154016; cv=none; b=BYj/bupgmg3lJhUOpnQZfZdZ905VzaM0hyI5xkOr+LiiVB3uLfGdrc0x+h/vzK+cvqMAf2zX/PlZnnZLTioE8j2yjHdVbD9nMoElwyDAReLtrd/UYHWPOfESU2veWyjsnScjX9KDUfXBLX2oSnXYKaHZhp1/bhqkHAss0fbJSgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752154016; c=relaxed/simple;
	bh=5Ctz6ppoPsVw1Hlr5w+/REjzLp+GdUhfHuyLu7DoLUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hxh3iJyNoGe7wqBpevpWwVLkxjdbuKvCnpOxtiQgaA87yVIfry5GS4BkfMwaayyWvsthAVBHdB/y2gE5rZxV3uJkCeOSiFMQqvzqZgV3EJy6qEyWQwDaUt8eBL6ZmnY5nG6x5FAMaVMWNJXTWzjL7Jv4SPg8V4tT0G14e2vwbDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BQe2G3v1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752154013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y8QnPx5eDjL+C/vFsdijabx9GM1KyxSUkFZ98UfXhuc=;
	b=BQe2G3v1orYwLgD4Vr21sqUl0nIszydSWqj6oj/RnZVsWrx/BTDK6tXm4SBFw+KiMDFeUT
	285aExW2LAQKJoNCxX47zwfkdAx28M4oPui1hWgmtrj5meJbmgv+l2X20CK88+eZADIEOk
	+UhDXHDk44v/LqijyuM5QK+89xZ5KpM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-PFCwr_GsNciUiezwRvOukg-1; Thu, 10 Jul 2025 09:26:51 -0400
X-MC-Unique: PFCwr_GsNciUiezwRvOukg-1
X-Mimecast-MFC-AGG-ID: PFCwr_GsNciUiezwRvOukg_1752154010
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f6ba526eso601169f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Jul 2025 06:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752154010; x=1752758810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8QnPx5eDjL+C/vFsdijabx9GM1KyxSUkFZ98UfXhuc=;
        b=pSf0fW06DBAH8lzOcE7BWF4L9/aeoTJohtLtUUue9Kl2Om0quSJhxOf9W8ctZG+t4G
         PRkHV87H/xyika7ffRtr7pGwEIz2UwkylID0cXbrLut/aNMCqSJvrkNtPy6Yi8woFMN2
         q+I++Hc1Td5fICYEAB3l/Azpk1jjWy8PdOOh9YCy4mxPvflfFPNtW/nQWHKtPZGzJ/h6
         KE1VkgMb7ZUZ3fXx/CQYpGBtJwrd4h2EJ/C3GKt+2pOgDEbrC1+E6LGmbZYm2aulyVjR
         ur5gTIhAmLfdaBFXTIvHGUjpWetBfVyyrPuKXnbzOdT2uh/Fw3HC7AcC4JEmj290sRHl
         lg2w==
X-Forwarded-Encrypted: i=1; AJvYcCVVXHQTJpOCZInzSDMY/KejYuI3UB9f12ugCj7iYPXorrK57gqKiAAUb+GtsTiJO1IQI7JD6ZslWr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrKD9vHRh6W4E1s1bBFueOGNqYukXuDOfiUg0Y4kJ0a9O4LvVy
	atfUrIZ1OLW56n07gzPGqHdBzvggd0d2OBy+qQ7xqRjKQlhhFaZKr6sHSFN6gfXyzabaluVgCpC
	BC2aLHWremWGpHyzZ6WTS63K3NtiB7lYnK8gtH3VxcIZa6vr4yjp0ia30waiyKw==
X-Gm-Gg: ASbGncvSLqXVpUsGPxA9aHcRF2IDqB4PG89/UBqVwCIqAnUdV8zZ5rvetXNF0SHR/qv
	xXkF+KAfWk6VVjbEgU2Ix1c2N73aO1pbydeX4Xhwf3SDmV9l38KRprOg/Of3z4TTbK/+panJE+o
	99J//YTnKCvdUYMFmVTL5TNpW+j+FBYdo4d9B9zpcpGXfJBVwFqyScLrLWO7ptbeXa1zgBSGJuH
	T4+rBKuiGbbJl6XBtgCJiHPri91FCmTkbm0/UqJO9wmmBlfhNFi8L1ly8jzosoPOyYd4KnKBx26
	UWxDEH+gRv2mM20SrorkKskmjgyawjuL/QCmWMzLWu5zNDeavoBZc9MjYyzEvSIv4PRk9w==
X-Received: by 2002:a05:6000:4904:b0:3b5:e714:9770 with SMTP id ffacd0b85a97d-3b5e7898fbdmr3803994f8f.14.1752154010124;
        Thu, 10 Jul 2025 06:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw62oeN5118S4VaFp3Hi2Tc5jqVMHx5Yz94QXI2Hu1g3A0gaINAjD2QNl5LE24mj7d4HIAgg==
X-Received: by 2002:a05:6000:4904:b0:3b5:e714:9770 with SMTP id ffacd0b85a97d-3b5e7898fbdmr3803943f8f.14.1752154009302;
        Thu, 10 Jul 2025 06:26:49 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:271f:bc10:144e:d87a:be22:d005? ([2a0d:3344:271f:bc10:144e:d87a:be22:d005])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e269a0sm1843225f8f.86.2025.07.10.06.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 06:26:48 -0700 (PDT)
Message-ID: <858eb643-bf0a-480e-b7f7-103b7bd94707@redhat.com>
Date: Thu, 10 Jul 2025 15:26:47 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5] ipv6: add `force_forwarding` sysctl to enable
 per-interface forwarding
To: Gabriel Goller <g.goller@proxmox.com>,
 Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, David Ahern <dsahern@kernel.org>,
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20250707094307.223975-1-g.goller@proxmox.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250707094307.223975-1-g.goller@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/7/25 11:43 AM, Gabriel Goller wrote:
> It is currently impossible to enable ipv6 forwarding on a per-interface
> basis like in ipv4. To enable forwarding on an ipv6 interface we need to
> enable it on all interfaces and disable it on the other interfaces using
> a netfilter rule. This is especially cumbersome if you have lots of
> interface and only want to enable forwarding on a few. According to the
> sysctl docs [0] the `net.ipv6.conf.all.forwarding` enables forwarding
> for all interfaces, while the interface-specific
> `net.ipv6.conf.<interface>.forwarding` configures the interface
> Host/Router configuration.
> 
> Introduce a new sysctl flag `force_forwarding`, which can be set on every
> interface. The ip6_forwarding function will then check if the global
> forwarding flag OR the force_forwarding flag is active and forward the
> packet.
> 
> To preserver backwards-compatibility reset the flag (on all interfaces)
> to 0 if the net.ipv6.conf.all.forwarding flag is set to 0.
> 
> Add a short selftest that checks if a packet gets forwarded with and
> without `force_forwarding`.
> 
> [0]: https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt
> 
> Signed-off-by: Gabriel Goller <g.goller@proxmox.com>

Does not apply cleanly anymore, please rebase and repost.

Also a few nits below...

> @@ -857,6 +859,9 @@ static void addrconf_forward_change(struct net *net, __s32 newf)
>  		idev = __in6_dev_get_rtnl_net(dev);
>  		if (idev) {
>  			int changed = (!idev->cnf.forwarding) ^ (!newf);
> +			/* Disabling all.forwarding sets 0 to force_forwarding for all interfaces */
> +			if (newf == 0)
> +				WRITE_ONCE(idev->cnf.force_forwarding, newf);

You could use:

			WRITE_ONCE(idev->cnf.force_forwarding, 0);
				

>  
>  			WRITE_ONCE(idev->cnf.forwarding, newf);
>  			if (changed)
> @@ -5719,6 +5724,7 @@ static void ipv6_store_devconf(const struct ipv6_devconf *cnf,
>  	array[DEVCONF_ACCEPT_UNTRACKED_NA] =
>  		READ_ONCE(cnf->accept_untracked_na);
>  	array[DEVCONF_ACCEPT_RA_MIN_LFT] = READ_ONCE(cnf->accept_ra_min_lft);
> +	array[DEVCONF_FORCE_FORWARDING] = READ_ONCE(cnf->force_forwarding);
>  }
>  
>  static inline size_t inet6_ifla6_size(void)
> @@ -6747,6 +6753,76 @@ static int addrconf_sysctl_disable_policy(const struct ctl_table *ctl, int write
>  	return ret;
>  }
>  
> +static void addrconf_force_forward_change(struct net *net, __s32 newf)
> +{
> +	struct net_device *dev;
> +	struct inet6_dev *idev;
> +
> +	for_each_netdev(net, dev) {
> +		idev = __in6_dev_get_rtnl_net(dev);
> +		if (idev) {
> +			int changed = (!idev->cnf.force_forwarding) ^ (!newf);
> +
> +			WRITE_ONCE(idev->cnf.force_forwarding, newf);
> +			if (changed) {
> +				inet6_netconf_notify_devconf(dev_net(dev), RTM_NEWNETCONF,
> +							     NETCONFA_FORCE_FORWARDING,
> +							     dev->ifindex, &idev->cnf);
> +			}

Brakets not needed for the above statement. Either drop them or move the
WRITE_ONCE() inside the if ()

> diff --git a/tools/testing/selftests/net/ipv6_force_forwarding.sh b/tools/testing/selftests/net/ipv6_force_forwarding.sh
> new file mode 100644
> index 000000000000..62adc9d4afc9
> --- /dev/null
> +++ b/tools/testing/selftests/net/ipv6_force_forwarding.sh
> @@ -0,0 +1,105 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Test IPv6 force_forwarding interface property
> +#
> +# This test verifies that the force_forwarding property works correctly:
> +# - When global forwarding is disabled, packets are not forwarded normally
> +# - When force_forwarding is enabled on an interface, packets are forwarded
> +#   regardless of the global forwarding setting
> +
> +source lib.sh
> +
> +cleanup() {
> +    cleanup_ns $ns1 $ns2 $ns3
> +}
> +
> +trap cleanup EXIT
> +
> +setup_test() {
> +    # Create three namespaces: sender, router, receiver
> +    setup_ns ns1 ns2 ns3
> +
> +    # Create veth pairs: ns1 <-> ns2 <-> ns3
> +    ip link add name veth12 type veth peer name veth21
> +    ip link add name veth23 type veth peer name veth32
> +
> +    # Move interfaces to namespaces
> +    ip link set veth12 netns $ns1
> +    ip link set veth21 netns $ns2
> +    ip link set veth23 netns $ns2
> +    ip link set veth32 netns $ns3
> +
> +    # Configure interfaces
> +    ip -n $ns1 addr add 2001:db8:1::1/64 dev veth12
> +    ip -n $ns2 addr add 2001:db8:1::2/64 dev veth21
> +    ip -n $ns2 addr add 2001:db8:2::1/64 dev veth23
> +    ip -n $ns3 addr add 2001:db8:2::2/64 dev veth32

The above will trigger DaD...

> +
> +    # Bring up interfaces
> +    ip -n $ns1 link set veth12 up
> +    ip -n $ns2 link set veth21 up
> +    ip -n $ns2 link set veth23 up
> +    ip -n $ns3 link set veth32 up
> +
> +    # Add routes
> +    ip -n $ns1 route add 2001:db8:2::/64 via 2001:db8:1::2
> +    ip -n $ns3 route add 2001:db8:1::/64 via 2001:db8:2::1
> +
> +    # Disable global forwarding
> +    ip netns exec $ns2 sysctl -qw net.ipv6.conf.all.forwarding=0
> +}
> +
> +test_force_forwarding() {
> +    local ret=0
> +
> +    echo "TEST: force_forwarding functionality"
> +
> +    # Check if force_forwarding sysctl exists
> +    if ! ip netns exec $ns2 test -f /proc/sys/net/ipv6/conf/veth21/force_forwarding; then
> +        echo "SKIP: force_forwarding not available"
> +        return $ksft_skip
> +    fi
> +
> +    # Test 1: Without force_forwarding, ping should fail
> +    ip netns exec $ns2 sysctl -qw net.ipv6.conf.veth21.force_forwarding=0
> +    ip netns exec $ns2 sysctl -qw net.ipv6.conf.veth23.force_forwarding=0
> +
> +    if ip netns exec $ns1 ping -6 -c 1 -W 2 2001:db8:2::2 &>/dev/null; then
> +        echo "FAIL: ping succeeded when forwarding disabled"
> +        ret=1
> +    else
> +        echo "PASS: forwarding disabled correctly"
> +    fi
> +
> +    # Test 2: With force_forwarding enabled, ping should succeed
> +    ip netns exec $ns2 sysctl -qw net.ipv6.conf.veth21.force_forwarding=1
> +    ip netns exec $ns2 sysctl -qw net.ipv6.conf.veth23.force_forwarding=1
> +
> +    if ip netns exec $ns1 ping -6 -c 1 -W 2 2001:db8:2::2 &>/dev/null; then
> +        echo "PASS: force_forwarding enabled forwarding"

... I'm wondering if it could sometimes race with the ping and cause
sporadic failures? Possible using 'nodad' option for address creation
could help.

/P


