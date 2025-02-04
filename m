Return-Path: <linux-doc+bounces-36762-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5677AA271CE
	for <lists+linux-doc@lfdr.de>; Tue,  4 Feb 2025 13:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDC843A4564
	for <lists+linux-doc@lfdr.de>; Tue,  4 Feb 2025 12:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D145B20DD68;
	Tue,  4 Feb 2025 12:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gpf4dkAg"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159FD20DD5A
	for <linux-doc@vger.kernel.org>; Tue,  4 Feb 2025 12:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738672166; cv=none; b=MYdEJnXGcrz14NFYvxy28+GcOhOQ2Q5LXkfwff5FeK/5RnV/PAAp9Gxds1NRiotWkPl3vXgkqEeB5nJWjfzn8qkqicCFdE9D04rPm4SIcpYpdsNbOq3R3hteNNqEsUhtA53PS808WLC+clgm4xkOs2urHkCQASMHneeC6m/kTj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738672166; c=relaxed/simple;
	bh=u6K1gc6fqbQ9CyQmR1XZtEDc+/599QHfU81+5JM+XJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nhunIFrmbg62xND0vptJW89LqvKvTJF8ZVL+yuxKFGPYNSnot9Q0X0/UbUNjLVjVvbj2KtTkepMWkvrDximyKPb21L941ZjWNaFwjTwlfb3tlg1HyyNb+x392F3eeIZYUn0SotYr0nWbWjQ1L0Gw0ruxq7Lh+KldgzrWfHF92Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gpf4dkAg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738672164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SVt11t4VdzXmaGrVYonLKU4tNbyq45g4LumiKNuZLV8=;
	b=gpf4dkAgfZJjGroqrLhLo3yFumiFQAk31z5ESXLMhDdRsT+lQuGavqltxlpN/7zOUmC8nh
	aTwS84LAU+1deAaNSOI9AuQ2yVC1ACrk8zt+e2NXiwMKgha1x6qno/cGPZp+dWxl/+QdRm
	nlNcTk6Bf1bHEzcw+QtC4YaaxFYDY2o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-L5SQTvP9On-pH9Dz9Rj8Ww-1; Tue, 04 Feb 2025 07:29:22 -0500
X-MC-Unique: L5SQTvP9On-pH9Dz9Rj8Ww-1
X-Mimecast-MFC-AGG-ID: L5SQTvP9On-pH9Dz9Rj8Ww
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4359eb032c9so38998995e9.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 04:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738672161; x=1739276961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVt11t4VdzXmaGrVYonLKU4tNbyq45g4LumiKNuZLV8=;
        b=FUhXoUcmUKJQPu5hdvAxR/LIfrttAuah0L2+2FFDeK292FJzuD2z4qXmZkscZDNMNL
         UWIg8vV/9VGuK+Wq+TTBl4KX4yE8NBzVbpG0PWkWAeEdTYdCUMZGuZUWDNqRdCZ0Paw8
         bHxKyG5KWySY2k4U8Nvwb8hABuhlYeM3sKfAbWfiREMVXSmvE2ZHxmU+TwZmv3R85AmU
         4YCwDzMUzwFIgITwGnPzuTEK8w9b65mjG9DZbjdno4Kcm5YU5bWWIp7aDVfKxY5NuMi3
         SA6CtX9dY9OR+YmhhvEcWzKoykohs+1NVQY3tASX4GYLSwjy91LgsFlI42MHUGoLrswy
         tGMw==
X-Forwarded-Encrypted: i=1; AJvYcCV+rUqCXnLzPBhohPmRGYhenNXt+YoKQM8t6cfDAaAj1Ch1j6a5AHOq8/LYaKvcRNtQbeUfteEf64I=@vger.kernel.org
X-Gm-Message-State: AOJu0YymleoRDbynS4QWygyRWHEfIuz29DQTYjt3QCQ/gdZc62QUbiNq
	zgeft7wZBDI1aLe4jNZGAMxLoK3cQ3lMpQbMXXmtkcFzCQKBgDo3buWZTZPLXPJKugkC4n/Whqq
	/SOTByvxLFC1Ops+vbOOVvQAawkJb5QPA5L/VPoziWhHUlDoHCpQJoTY22w==
X-Gm-Gg: ASbGncvKr1rUIOjhYwOrApS0v0S+vkUf2BCgmWWZipsQDwbpmniKhiobWInoujvdOdy
	MxkkX1TUUogw8rhMq4D5Qgwu0qkJYS/Qgznu6ITJKW8GVnwfYM4JE+64m+pYPZWNo0Q0uaVeEW2
	jDRPASE5b0wWTRKWRBCif8855YfEYTOjcyKQj7wWSOXx7zllfGLbO6aYUHTrfd600lDki+2o5Wq
	Kjf6pYmJ0r/uP/k8huvEYgxd+aQqeWAdfdLGThnuw4QSaOaBjCVNOF+HfjghkfRF+3Q/YvDOJZh
	ANBZU1HRs0MqO02+3J/taWoT/SesKbRCHY4=
X-Received: by 2002:a05:600c:5248:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-438dc3cac3cmr242156415e9.14.1738672161582;
        Tue, 04 Feb 2025 04:29:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6sf3mUWx9f6oCktAawZ1NkGZse1Cb+QiEWr0dnqS8PjvhkiCOef50Jj0CTOWCanLTCjNSYQ==
X-Received: by 2002:a05:600c:5248:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-438dc3cac3cmr242156005e9.14.1738672161191;
        Tue, 04 Feb 2025 04:29:21 -0800 (PST)
Received: from [192.168.88.253] (146-241-41-201.dyn.eolo.it. [146.241.41.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc8a59dsm228847985e9.40.2025.02.04.04.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 04:29:20 -0800 (PST)
Message-ID: <c8dd0458-b0a9-4342-a022-487e73542381@redhat.com>
Date: Tue, 4 Feb 2025 13:29:18 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/6] selftests: ncdevmem: Implement devmem TCP
 TX
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux.dev,
 linux-kselftest@vger.kernel.org
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Neal Cardwell <ncardwell@google.com>, David Ahern <dsahern@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>,
 sdf@fomichev.me, asml.silence@gmail.com, dw@davidwei.uk,
 Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>,
 Pedro Tammela <pctammela@mojatatu.com>,
 Samiullah Khawaja <skhawaja@google.com>
References: <20250203223916.1064540-1-almasrymina@google.com>
 <20250203223916.1064540-3-almasrymina@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250203223916.1064540-3-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/3/25 11:39 PM, Mina Almasry wrote:
> Add support for devmem TX in ncdevmem.
> 
> This is a combination of the ncdevmem from the devmem TCP series RFCv1
> which included the TX path, and work by Stan to include the netlink API
> and refactored on top of his generic memory_provider support.
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Usually the self-tests are included towards the end of the series, to
help reviewers building-up on previous patches knowledge.

>  .../selftests/drivers/net/hw/ncdevmem.c       | 300 +++++++++++++++++-
>  1 file changed, 289 insertions(+), 11 deletions(-)

Why devmem.py is not touched? AFAICS the test currently run ncdevmem
only in server (rx) mode, so the tx path is not actually exercised ?!?

/P


