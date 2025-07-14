Return-Path: <linux-doc+bounces-53005-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B22B04243
	for <lists+linux-doc@lfdr.de>; Mon, 14 Jul 2025 16:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DFA97A6ECA
	for <lists+linux-doc@lfdr.de>; Mon, 14 Jul 2025 14:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F8B2580F1;
	Mon, 14 Jul 2025 14:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AvV3ek8Q"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894CA253F11
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 14:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752504908; cv=none; b=hLQoVzfQXAgUbpFiwC9ltzQB8Q+F0iaMoR+0TcWgVf8/E0/huY48FyhtbEmIXfbtkrwCBtUUkw6lFjVjUedNzvvN4F56DmDB2+kt+yE8RGRg2dnNxzkq7vtth7Jmc4ULExRtYtLOQcECLFSgjaW6Mj3J4056Zirsc5vTe60/WyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752504908; c=relaxed/simple;
	bh=JyG/AJppLSffr5nyP8a8dgSsegV2gn4CUhImXqjMdRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dfzq8jRIaGAaRQ/5MqXuIM6FwhKcwskSXOxEksLU+vPyXeTFk6klWmbJ2gNLs/qNs73CeqbjlmKUvWCWN4ssZO30jgHmqHAE1ti/k/YEyys5GKC9u1Iv3KNjO7nHs69aYQ5RDhih2xITgDAVXZxyWAwnJqkiFzHnRWm/wbiIX1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AvV3ek8Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752504905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d4czQZKucpykxaQ1IUiKG7YZbA5p+JpK4GLzUGwBBME=;
	b=AvV3ek8QwGS4/XpjWNO+Zjng2s/DBPNr6HHy9E6nsWTia7WpSJJH02t21EbYZHUF2eXJna
	MjpmPkq8HMnRcIXUaiw1HX16A3Bsrd+SnUM+WC4v8bv7VvWb6eBp/cI7EzHy7//QG6Vf/3
	s88XSMuy2gqt8zx82Me3oldNnRTF3Jk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-KkqKqxiJNkKI4J6E2CcJlQ-1; Mon, 14 Jul 2025 10:55:03 -0400
X-MC-Unique: KkqKqxiJNkKI4J6E2CcJlQ-1
X-Mimecast-MFC-AGG-ID: KkqKqxiJNkKI4J6E2CcJlQ_1752504903
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so2621361f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 07:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752504903; x=1753109703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d4czQZKucpykxaQ1IUiKG7YZbA5p+JpK4GLzUGwBBME=;
        b=LY73DbRZJ24DP+AhNSfo0EDbFeS9IJgxMrECsGmCgBi2rzpZu+5fE+deEWzSQ0Rike
         U7Ng0OOj/9pxy7602Q/VEt0snd11b9fKf8FR14fC8kfIByzGEogJUMWIAKWBxnjRTJjo
         Uu2ufhB+tiwYyKyKkQGuobfScdC6cRKZpMWZjG+nChiPgFHtH2jmlC0AZaB+RWmi2Gns
         /AskvUziVthh/K+agsam6ByTEH14snH4qycP1epDY9V4ull2ACOy4qhSFeQDo7Qvccw7
         +D6OFMy/eMaT7vSrMUoL9xYkFHhaBSxSQ5nlrHXHgTU39n3zMkVXeZEr+R4CdmE0CT+L
         +S6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWPOAJLhATrMhHZ4SV76Q3rcUfT8Yng6Mzj7RYBomV/BNhUPtXD5bz47k6JJ8w+1hAoAtXxPEpR4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMcDZqF5g4vAQaMJ1xHQUBpVYlSdEkGeHGy4EbI5K0zeec1a4z
	KguPaKEMrfLtQxHTmO7ZnddqMqnlxPKWuX5X+AFxv0SYxyq+9LsY4kf3VOxxtl+HC5ufkrLeM4g
	TBC0XHAGOhLSODoRqn80VsVMhG3thkAq4L/14IoQ1z38K5FUBQmmE09oPG+26IQ==
X-Gm-Gg: ASbGncvgTqVg35wzem1zoc8CF1B5D67x8kPNEF9/gPZKFHia3aVMU8Ov1OOdF1Xe4Ze
	1Wwd/YcsROwM/JSyESXuoSxyC+YqQcSjYKigvhWYshqQyQyzMXiQdvXNzrgbKR/YBcnscLTz9yx
	Fv6GvrTv7sAWEZVUaHaRc4+fUzyj4R4CXH1/C2Gif3cRLDZ+cr716eBGa5i8mCtmw+81MW+Rm0m
	YKL0WsfWbWZpVGw41CWRcl0tr1emz+So3XL0cUFfc09jMIRRWFwqQfcLM1/Zp2lfJu8yZ7AntYH
	PfI1vIT0UPlQukVjze0KAVxBWvu2cOqPQdcXUWyjYDQ=
X-Received: by 2002:a05:6000:18a5:b0:3a6:d5fd:4687 with SMTP id ffacd0b85a97d-3b5f2dc2906mr7617432f8f.18.1752504902641;
        Mon, 14 Jul 2025 07:55:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERlxdXbSclUMLbYuj4ecUcsIzdJdVAuc2ie1F4jKPNjqTeVSRJVRcaIsaZVJV8X9Sn1hIeGQ==
X-Received: by 2002:a05:6000:18a5:b0:3a6:d5fd:4687 with SMTP id ffacd0b85a97d-3b5f2dc2906mr7617398f8f.18.1752504902111;
        Mon, 14 Jul 2025 07:55:02 -0700 (PDT)
Received: from [192.168.0.115] ([212.105.155.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1776sm12844954f8f.12.2025.07.14.07.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:55:01 -0700 (PDT)
Message-ID: <b2c0653e-077f-4609-922e-777f1d868dd0@redhat.com>
Date: Mon, 14 Jul 2025 16:54:59 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 net-next 12/15] tcp: accecn: AccECN option send
 control
To: chia-yu.chang@nokia-bell-labs.com, edumazet@google.com,
 linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org,
 dsahern@kernel.org, kuniyu@amazon.com, bpf@vger.kernel.org,
 netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com,
 kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com,
 jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch,
 donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org,
 ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com,
 g.white@cablelabs.com, ingemar.s.johansson@ericsson.com,
 mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at,
 Jason_Livingood@comcast.com, vidhi_goel@apple.com
References: <20250704085345.46530-1-chia-yu.chang@nokia-bell-labs.com>
 <20250704085345.46530-13-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250704085345.46530-13-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/4/25 10:53 AM, chia-yu.chang@nokia-bell-labs.com wrote:
> @@ -285,9 +297,33 @@ static inline void tcp_ecn_received_counters(struct sock *sk,
>  
>  		if (len > 0) {
>  			u8 minlen = tcp_ecnfield_to_accecn_optfield(ecnfield);
> +			u32 oldbytes = tp->received_ecn_bytes[ecnfield - 1];
> +
>  			tp->received_ecn_bytes[ecnfield - 1] += len;
>  			tp->accecn_minlen = max_t(u8, tp->accecn_minlen,
>  						  minlen);
> +
> +			/* Demand AccECN option at least every 2^22 bytes to
> +			 * avoid overflowing the ECN byte counters.
> +			 */
> +			if ((tp->received_ecn_bytes[ecnfield - 1] ^ oldbytes) &
> +			    ~((1 << 22) - 1)) {

I don't understand the above statement, I don't think it yield the
result expected according to the above comment.

> @@ -365,6 +401,7 @@ static inline void tcp_accecn_init_counters(struct tcp_sock *tp)
>  	__tcp_accecn_init_bytes_counters(tp->received_ecn_bytes);
>  	__tcp_accecn_init_bytes_counters(tp->delivered_ecn_bytes);
>  	tp->accecn_minlen = 0;
> +	tp->accecn_opt_demand = 0;
>  	tp->est_ecnfield = 0;
>  }
>  
> @@ -447,6 +484,7 @@ static inline void tcp_ecn_rcv_synack(struct sock *sk, const struct tcphdr *th,
>  	default:
>  		tcp_ecn_mode_set(tp, TCP_ECN_MODE_ACCECN);
>  		tp->syn_ect_rcv = ip_dsfield & INET_ECN_MASK;
> +		tp->accecn_opt_demand = 2;
>  		if (INET_ECN_is_ce(ip_dsfield) &&
>  		    tcp_accecn_validate_syn_feedback(sk, ace,
>  						     tp->syn_ect_snt)) {
> @@ -467,6 +505,7 @@ static inline void tcp_ecn_rcv_syn(struct tcp_sock *tp, const struct tcphdr *th,
>  		} else {
>  			tp->syn_ect_rcv = TCP_SKB_CB(skb)->ip_dsfield &
>  					  INET_ECN_MASK;
> +			tp->prev_ecnfield = tp->syn_ect_rcv;
>  			tcp_ecn_mode_set(tp, TCP_ECN_MODE_ACCECN);
>  		}
>  	}
> @@ -565,4 +604,16 @@ tcp_ecn_make_synack(const struct request_sock *req, struct tcphdr *th)
>  		th->ece = 1;
>  }
>  
> +static inline bool tcp_accecn_option_beacon_check(const struct sock *sk)
> +{
> +	const struct tcp_sock *tp = tcp_sk(sk);
> +
> +	if (!READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_ecn_option_beacon))
> +		return false;
> +
> +	return tcp_stamp_us_delta(tp->tcp_mstamp, tp->accecn_opt_tstamp) *
> +	       READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_ecn_option_beacon) >=
> +	       (tp->srtt_us >> 3);

To be consistent:

	u32 ecn_beacon =
READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_ecn_option_beacon);

	if (!ecn_beacon)
		return false;

	return tcp_stamp_us_delta(tp->tcp_mstamp, tp->accecn_opt_tstamp) *
ecn_beacon // ...

/P


