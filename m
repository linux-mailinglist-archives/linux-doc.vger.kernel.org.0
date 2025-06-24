Return-Path: <linux-doc+bounces-50278-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF27AE5CF7
	for <lists+linux-doc@lfdr.de>; Tue, 24 Jun 2025 08:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08EA84A6566
	for <lists+linux-doc@lfdr.de>; Tue, 24 Jun 2025 06:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B70F248F6F;
	Tue, 24 Jun 2025 06:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cKzXo5p7"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2946524468D
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 06:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747187; cv=none; b=Q/ur1vj7VLXErNHPF93Fn9z4NSktddQ2ElOS8jWOwXFu1lsOaMCCkjIhcv4/c6Rr4L1TNGszcYLfcJzZHd5Ig9Styd6PXJCya5fQJMGtAxQk+LPqFFZxBn53J5nbKvRwHwrpYdPvnostJan5eZvBV8dEU1Khrey/wUojFeBRDFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747187; c=relaxed/simple;
	bh=H3vD1Sbnp47JGxyvSTEQVnImmd+u2eOSUhKKEDWw0QQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tnv9l1O8vDlxDMKukhJ+klQcbhMfzVq2tI/ku3UdQy5npbyrr6/V66tWVYf5Rb9PymWO2ElUf6/vO/rmiG87F3y8UFQQ/lNbKs1jI15xjaXH+95W5LiPmJNUy2sD6OZTw7QiUA7cNy+rGyvDR8ZuHo4Q1YkpOdA7XnlXFBHjJkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cKzXo5p7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750747184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/0vywc+1kvwMJ/9tqmlAocBgqq2MVsmyNnlstdC9NI=;
	b=cKzXo5p7UFQK6KZaZf2HH7SpHMdOcwJ146YPZcMNJ4IHYbLFmIXlAZK1NEzihDPdm6nAah
	r9//WhEu4KdmKY42UFu/BbP9PpSGxjj0dkdoY9pZwynWorg5bqCPBj3ixf3Jb2pu2JGgzn
	ZMMzfzAOZzYfAcOslIW2XY86u4TT/Cg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-mY1xfg1JOJ6opekQ2hDyYQ-1; Tue, 24 Jun 2025 02:39:42 -0400
X-MC-Unique: mY1xfg1JOJ6opekQ2hDyYQ-1
X-Mimecast-MFC-AGG-ID: mY1xfg1JOJ6opekQ2hDyYQ_1750747181
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4535f803ec5so34267845e9.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 23:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750747181; x=1751351981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/0vywc+1kvwMJ/9tqmlAocBgqq2MVsmyNnlstdC9NI=;
        b=PphxRgG91x8tLAyKqDhh7rtljpRuPIhzRCAIe/O0aJUlfej3ZqSITBl5qUT4VhYBLC
         Laq/tfEKG2FYOZj/L1unhwd3R+9ZjyDuGXBctkMWSq37MGQ+8Bjm11NxNYR1sNOxrdjz
         RItUJ/N3GXttIl+8NMBN73Pczb88cXorVPuWSvi6fwLYeG3+9b0s2insm7pcla/I0aBV
         3hdP/WvYpzxu0UdbjwlVkhy4dVgKe/fLZLupJhUQmc2tSc1GiBMgJkBC96wZ95MsR+aH
         NDHnDvuvWwprh8Zc9t0ccTBLjDVP1rU+e/ZffyQZvCu9emQ5DMvb3R6RYE6XEYhwkOb2
         d69Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFnJRlyKuv1aXvvL2yYBBu8yn5Gs8EUuRAjd21sIuBsoT86TiAi/bTe2HrMHonhRjI6h27lHp3zwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmSLLQNbnKBlLB9wccObxiBR7a6f4C0eoJHxGlhb7cDBosiNAt
	Iw9lC4ti3GdkT9vxS9+nToMegAQsSlVLhcfxo10+TZn9HjpVUYiYg1FPdoAOWObJ4xMR2f1l1ZT
	R7Iysug8OHVj6n0erNLZ9vFOWc1FUFESIkkn6Z79gIRZED1AkzBgxpFSLIBELJg==
X-Gm-Gg: ASbGncukI8ox0sOZJWihz85PHyJmnUGwqmAaS5YKaSM113UWH2yvaA9wzJU3VN83htC
	L+8GOB1v7YOr3En9gw9BJunYs5GJiVzAQUP7iD48d8h0Vrh4jvsFb0xPtFovAhpkyJzfcDbz+Si
	mLpwUMi6RUqNT1HlDtXt1oevB1Y/C6HDXjh4wrYSYvkr2NTVgzYtZVp/7tKOyS/VGMY0vNr9ItD
	JSMNmeR4D7Xloc6hhB8UobfIHL+VGB6ObXydx/QLMLQAamKFIDVeiU1e1rnIDMyBDrumROWQ2PZ
	0Dwrr4O5EYX18hTprOs8XaH0gtZanw==
X-Received: by 2002:a05:600c:474b:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-453659b87a8mr127411955e9.1.1750747180804;
        Mon, 23 Jun 2025 23:39:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVNxkrcd1Ty7G+K9PjLk2XfFqnUfZzzJS5GBTHEgoGX0ZqSTbQ4aCxdDlvkl26+NOQkuwHAw==
X-Received: by 2002:a05:600c:474b:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-453659b87a8mr127411485e9.1.1750747180263;
        Mon, 23 Jun 2025 23:39:40 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80516desm1114668f8f.11.2025.06.23.23.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 23:39:39 -0700 (PDT)
Message-ID: <ed5283a7-674b-4c5a-aade-c4f220485ce8@redhat.com>
Date: Tue, 24 Jun 2025 08:39:36 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 net-next 09/15] tcp: accecn: AccECN option
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "horms@kernel.org" <horms@kernel.org>,
 "dsahern@kernel.org" <dsahern@kernel.org>,
 "kuniyu@amazon.com" <kuniyu@amazon.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dave.taht@gmail.com" <dave.taht@gmail.com>,
 "jhs@mojatatu.com" <jhs@mojatatu.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "stephen@networkplumber.org" <stephen@networkplumber.org>,
 "xiyou.wangcong@gmail.com" <xiyou.wangcong@gmail.com>,
 "jiri@resnulli.us" <jiri@resnulli.us>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "donald.hunter@gmail.com" <donald.hunter@gmail.com>,
 "ast@fiberby.net" <ast@fiberby.net>,
 "liuhangbin@gmail.com" <liuhangbin@gmail.com>,
 "shuah@kernel.org" <shuah@kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
 <ncardwell@google.com>,
 "Koen De Schepper (Nokia)" <koen.de_schepper@nokia-bell-labs.com>,
 "g.white@cablelabs.com" <g.white@cablelabs.com>,
 "ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
 "mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>,
 "cheshire@apple.com" <cheshire@apple.com>, "rs.ietf@gmx.at"
 <rs.ietf@gmx.at>, "Jason_Livingood@comcast.com"
 <Jason_Livingood@comcast.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>
References: <20250610125314.18557-1-chia-yu.chang@nokia-bell-labs.com>
 <20250610125314.18557-10-chia-yu.chang@nokia-bell-labs.com>
 <d652445f-3637-44bf-ac92-483e9a323a49@redhat.com>
 <PAXPR07MB7984375C1887F1507F4E4726A37CA@PAXPR07MB7984.eurprd07.prod.outlook.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <PAXPR07MB7984375C1887F1507F4E4726A37CA@PAXPR07MB7984.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I'm sorry for the late reply.

On 6/21/25 1:22 AM, Chia-Yu Chang (Nokia) wrote:
> From: Paolo Abeni <pabeni@redhat.com Sent: Tuesday, June 17, 2025 11:27 AM
>> CAUTION: This is an external email. Please be very careful when clicking links or opening attachments. See the URL nok.it/ext for additional information.
>> On 6/10/25 2:53 PM, chia-yu.chang@nokia-bell-labs.com wrote:
>>> @@ -294,6 +295,9 @@ struct tcp_sock {
>>>               rate_app_limited:1;  /* rate_{delivered,interval_us} limited? */
>>>       u8      received_ce_pending:4, /* Not yet transmit cnt of received_ce */
>>>               unused2:4;
>>> +     u8      accecn_minlen:2,/* Minimum length of AccECN option sent */
>>> +             est_ecnfield:2,/* ECN field for AccECN delivered 
>>> + estimates */
>>
>> It's unclear to me why you didn't use the 4 bits avail in 'unused2', instead of adding more fragmented bitfields.
>>
> Hi Paolo,
> 	
> 	This is becuase some bits of unused2 will be used in latter patches.

I see. Still it would be more clear to use the avail unused space first.
The final effect/layout would be the same. Or add an explicit note in
the commit message.

>>> @@ -4236,6 +4375,7 @@ static int tcp_ack(struct sock *sk, const struct sk_buff *skb, int flag)
>>>       if (tcp_ecn_mode_accecn(tp))
>>>               ecn_count = tcp_accecn_process(sk, skb,
>>>                                              tp->delivered - 
>>> delivered,
>>> +                                            
>>> + sack_state.delivered_bytes,
>>>                                              &flag);
>>>
>>>       tcp_in_ack_event(sk, flag);
>>> @@ -4275,6 +4415,7 @@ static int tcp_ack(struct sock *sk, const struct sk_buff *skb, int flag)
>>>       if (tcp_ecn_mode_accecn(tp))
>>>               ecn_count = tcp_accecn_process(sk, skb,
>>>                                              tp->delivered - 
>>> delivered,
>>> +                                            
>>> + sack_state.delivered_bytes,
>>>                                              &flag);
>>
>> The two above chunks suggest you could move more code into
>> tcp_accecn_process()
> 
> I do not get your point here.
> 
> These two chunks reflect a new argument is added to tcp_accecn_process().
> 
> But the value of this argument is computed by other fnuctions already, so not sure how to move code into tcp_accecn_process().

My point is that the 2 above chunks are identical, so you could possibly
move more (idenical) code into the helper and reduce the code duplication.

>>> static void tcp_options_write(struct tcphdr *th, struct tcp_sock *tp,
>>>                       tp->duplicate_sack : tp->selective_acks;
>>>               int this_sack;
>>>
>>> -             *ptr++ = htonl((TCPOPT_NOP  << 24) |
>>> -                            (TCPOPT_NOP  << 16) |
>>> +             *ptr++ = htonl((leftover_bytes << 16) |
>>>                              (TCPOPT_SACK <<  8) |
>>>                              (TCPOLEN_SACK_BASE + (opts->num_sack_blocks *
>>>                                                    
>>> TCPOLEN_SACK_PERBLOCK)));
>>
>> Here leftover_size/bytes are consumed and not updated, which should be safe as they will not be used later in this function, but looks inconsistent.
>>
>> The whole options handling looks very fragile to me. I really would prefer something simpler (i.e. just use the avail space if any) if that would work.
> 
> I would still use leftover_size/bytes, but make it more consistent.
> 
> As this part of code already pass AccECN packetdrill tests.
> 
>>
>>> @@ -957,6 +1068,17 @@ static unsigned int tcp_syn_options(struct sock *sk, struct sk_buff *skb,
>>>               }
>>>       }
>>>
>>> +     /* Simultaneous open SYN/ACK needs AccECN option but not SYN */
>>> +     if (unlikely((TCP_SKB_CB(skb)->tcp_flags & TCPHDR_ACK) &&
>>> +                  tcp_ecn_mode_accecn(tp) &&
>>> +                  sock_net(sk)->ipv4.sysctl_tcp_ecn_option &&
>>> +                  remaining >= TCPOLEN_ACCECN_BASE)) {
>>> +             u32 saving = tcp_synack_options_combine_saving(opts);
>>> +
>>> +             opts->ecn_bytes = synack_ecn_bytes;
>>> +             remaining -= tcp_options_fit_accecn(opts, 0, remaining, saving);
>>> +     }
>>> +
>>>       bpf_skops_hdr_opt_len(sk, skb, NULL, NULL, 0, opts, &remaining);
>>>
>>>       return MAX_TCP_OPTION_SPACE - remaining;
>>
>> [...]
>>> @@ -1036,6 +1159,14 @@ static unsigned int tcp_synack_options(const 
>>> struct sock *sk,
>>>
>>>       smc_set_option_cond(tcp_sk(sk), ireq, opts, &remaining);
>>>
>>> +     if (treq->accecn_ok && sock_net(sk)->ipv4.sysctl_tcp_ecn_option &&
>>> +         remaining >= TCPOLEN_ACCECN_BASE) {
>>> +             u32 saving = tcp_synack_options_combine_saving(opts);
>>> +
>>> +             opts->ecn_bytes = synack_ecn_bytes;
>>> +             remaining -= tcp_options_fit_accecn(opts, 0, remaining, saving);
>>> +     }
>>> +
>>>       bpf_skops_hdr_opt_len((struct sock *)sk, skb, req, syn_skb,
>>>                             synack_type, opts, &remaining);
>>>
>>
>> The similarities of the above 2 chuncks hints you could move more code into tcp_options_fit_accecn().
>>
>> /P
> 
> I also do not get it, because tcp_options_fit_accecn() will be called with different argument values.
> 
> So, I would prefer to keep as it is.

AFAICS the 3 lines inside the if branch are identical. You could create
an helper for that.

Side note: I'm spending quite a bit of time trimming the irrelevant part
of the reply to make it as straightforward as possible. Please do the
same: having to navigate hundred of lines of unrelated quoted text to
find a single line of contents maximize the chances of missing it.

Thanks,

Paolo

/P


