Return-Path: <linux-doc+bounces-39385-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A31D7A44728
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2025 18:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 014C917D513
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2025 16:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FF1197A7A;
	Tue, 25 Feb 2025 16:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fv5CDFMc"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2735F1991CB
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 16:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740502563; cv=none; b=KjI0VzuPK2Z2w5OUJhwAAQpKcEhCCme8afdNUPFVsFi4AaIiiAJoQxi8npgfp9+UUuxTVu5n35FhdD/vMF5cw+byKsJpGrYbS340Po7peNUr35ot/wxtq40lJJKyEEPoh/kgu5JsbI7hjoy3/VemSgOwet2EJeff1Zsj+JsSWbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740502563; c=relaxed/simple;
	bh=nQ44Bzpza4hhTa9otIjinjm0k/20MprTjt+HR8ATJQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZRULtnRYgp42bz2+6icyn1paM+G8528qg3IO7KgZqiDqGuZ/te9QPimYIlx3jb7tAvv4tD0mDcN6BAlXqknwWvO0R4tVhJd4ROBjtNiB3l8toygIuApItw5riUEQtHQHwn5AfBJDfY8yf914WPBbPBRJ2x4nzyxBUrqSOX6dm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fv5CDFMc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740502561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gc6nQtNUWZYE/MaGMWTUUIeNQ1kSqCMg8WjpiOLHoso=;
	b=Fv5CDFMc4dI0JoJI8J9c3uJ1HojVNAI9eUZCKNUTnSNLaOoDwfMb/Q+8gFWzWM46Eto6TH
	Sc13yPaO1XhhF6a7j1+I0Fb5QlRt2sOJSLmDGAZjRZLviTo1gGRjDfTSYlbrNPEeXSIs+z
	GzXtbAV6H/Rn3lPumwUEzwK5ETbA5FI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-5PdA0M_HP-eDSoQRZnRkjw-1; Tue, 25 Feb 2025 11:55:57 -0500
X-MC-Unique: 5PdA0M_HP-eDSoQRZnRkjw-1
X-Mimecast-MFC-AGG-ID: 5PdA0M_HP-eDSoQRZnRkjw_1740502557
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4393b6763a3so25428685e9.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 08:55:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740502557; x=1741107357;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gc6nQtNUWZYE/MaGMWTUUIeNQ1kSqCMg8WjpiOLHoso=;
        b=f4xTN4/2HMPQcMtSKu163O+IswXrP4sIQFx+k6VXP8dVNJuThrq2ub2c0ElnxeC5/C
         wvFY9rjneUKGPGWjK3qjNSR5U0FO0OAzkLf3w1Zo12lGmhd6tDL7q68YdJvoSeGUyC4i
         fKPg8Ai+sbQdfyv+suqsJKOekiWcsTIPLDZkhwxGIcZ52vw2Om52ws2bTI5VOwVmFJbq
         S+WP6C1HQLe34Vu1W68TID9uqjTXMvDfGjgh7+wkqm5NOKIU7/rBmzewrMLagXCwsnaW
         h0lbooymcRwi9ywhrDd1h7Z/IerqARSX00ttRbTMbtR0E6A9p/t/9OZ7gx6sjQJ/L3Ml
         n3PA==
X-Forwarded-Encrypted: i=1; AJvYcCX0KW8f4pRo+BrqKkCkAb4prMCLWN8vgHvugjGPGKPtyctFEsuXE8Q3MGfPSbTtIwzJCaZp4YssvTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPBeSx2LC7/RjjsXuoDpuqxF/k035h9FpHIH9GwRkFvLcLsdgl
	PVXi+41FwGtJZTfjkzZb0CxVY5caDWLEAmJFQCKcfgjhPcCw1pXFWbKIyA0f9xt1YBoXdnvYIpY
	MBNVKKXXkSTDXxBRYgVqrzk/+OLBNgMfbfpl5okp0fgcTjATtKV/0CiW89A==
X-Gm-Gg: ASbGncsCJs8GU2Ur9RHaABhbMaWfmcuU5N4t9Z2XWxwoSo2ChrC/e3Xq5bd1vlwn/1t
	N6qnIL8fDx3wKDsE5lMP86QaIwc33fOqgAYAikBooh5npIE564Ji39agkye4GUiysbVZx1BBmZ0
	v2EzCLg/lfh6Bfy9bdhJP0uMgMoczKmpmO9ioCiJwvk/g9oGZcP0PZTeXsVGdbIV9MiJXHyVJeF
	Icob5eA5yI5FE58/BZaH/8LCyeFZ4O9pvrg0liUs9OBtpGzUbMeNSKstsSaMwUyrl4n6M4/B+yZ
	DDyvWiykVbaPbiZXmVjZD7r55HacnDNik0l7PX/AeHqOJtV1tnVWMkbEbNo4yNHKNbzVMh3YI1K
	EECDw5cGWwbeqvCbZzMXfax/9yC9gUpZ7BUjwCpkQVaI=
X-Received: by 2002:a05:600c:1396:b0:439:88bb:d02d with SMTP id 5b1f17b1804b1-439ae1d9a2dmr164242715e9.2.1740502556786;
        Tue, 25 Feb 2025 08:55:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzE/g/wzyX4nO+TszgBSun1B7uE43oREDnV0UH0oQHkzl3BhbsKqcoCLgqarg7oHx6lgcPEw==
X-Received: by 2002:a05:600c:1396:b0:439:88bb:d02d with SMTP id 5b1f17b1804b1-439ae1d9a2dmr164242175e9.2.1740502556358;
        Tue, 25 Feb 2025 08:55:56 -0800 (PST)
Received: from ?IPV6:2003:cb:c73e:aa00:c9db:441d:a65e:6999? (p200300cbc73eaa00c9db441da65e6999.dip0.t-ipconnect.de. [2003:cb:c73e:aa00:c9db:441d:a65e:6999])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce60asm149821775e9.7.2025.02.25.08.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 08:55:55 -0800 (PST)
Message-ID: <ce3ce109-f38a-4053-808b-5cc75257f3f7@redhat.com>
Date: Tue, 25 Feb 2025 17:55:53 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] KVM: Add capability to discover
 KVM_GMEM_NO_DIRECT_MAP support
To: Patrick Roy <roypat@amazon.co.uk>, rppt@kernel.org, seanjc@google.com
Cc: pbonzini@redhat.com, corbet@lwn.net, willy@infradead.org,
 akpm@linux-foundation.org, song@kernel.org, jolsa@kernel.org,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, jannh@google.com, shuah@kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, tabba@google.com, jgowans@amazon.com,
 graf@amazon.com, kalyazin@amazon.com, xmarcalx@amazon.com,
 derekmn@amazon.com, jthoughton@google.com
References: <20250221160728.1584559-1-roypat@amazon.co.uk>
 <20250221160728.1584559-5-roypat@amazon.co.uk>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250221160728.1584559-5-roypat@amazon.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.02.25 17:07, Patrick Roy wrote:
> Add a capability to let userspace discover whether guest_memfd supports
> removing its folios from the direct map. Support depends on guest_memfd
> itself being supported, but also on whether KVM can manipulate the
> direct map at page granularity at all (possible most of the time, just
> arm64 is a notable outlier where its impossible if the direct map has
> been setup using hugepages, as arm64 cannot break these apart due to
> break-before-make semantics).
> 
> Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
> ---

Not sure how KVM folks handle that, but I suspect we would just want to 
squash that into the previous commit,

-- 
Cheers,

David / dhildenb


