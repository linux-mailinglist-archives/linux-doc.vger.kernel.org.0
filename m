Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D992B2899
	for <lists+linux-doc@lfdr.de>; Fri, 13 Nov 2020 23:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgKMWfk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 13 Nov 2020 17:35:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52801 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726081AbgKMWfg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Nov 2020 17:35:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605306935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OxJxP1oE2Cla0I1OPN4NdLIp1AOD5ygh5VOrDf70gp4=;
        b=MilvLsfCmh00+SwNtgvhK/Quf4kOUEOUsJx5qH111zVi+7geFhnkEhcIN+XiZhzAx3Gjpc
        E/eTbyvIRJhGG854zrcGF0/TvXulfk3fZ8ZgD8zIo95L47NDupy4JEwRMzHp3fbgyJkNKy
        38Kc9FzWmA0KZyyrJYy4y28oZ6rBjUA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-OgsVCXRPPiat72NPr2uo1Q-1; Fri, 13 Nov 2020 17:35:32 -0500
X-MC-Unique: OgsVCXRPPiat72NPr2uo1Q-1
Received: by mail-wr1-f69.google.com with SMTP id h29so4591999wrb.13
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 14:35:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OxJxP1oE2Cla0I1OPN4NdLIp1AOD5ygh5VOrDf70gp4=;
        b=LInquiOogA4jZaXnKynAJi5Ayjqiu44iRJrr2bWUVV+omt4Tr3T9wWj9rCtyF4HYtU
         nIaAfSV+zTbo8edpv4Qj9DkPX44FZ+wQB6s7avL0Rz6xMHAYv/rwjGFAHU7+jpwQWE04
         7JYy5rHfkT3XxcldBbeIGczVpiGxRTfNhYtodN7PDkpvVHCQRFUDloqJG6+77Kq4LA+p
         P/JiI43TPMG8BtP2Vp+D3adG6j6E3ygGoyVggSjrhE3uPU9BbOL/tHLIN2IWozYyFQIb
         LweZb4pilIMAEF5FJYlehD8fZjr4RoJYtsT9HJFoUz0+TcDQynwwXRTsvqLQrM5qYYvx
         IRiQ==
X-Gm-Message-State: AOAM53257nN0qto6tcpGDsxsEjAKtOpzTSLmNb1HZqMqQ/d/iXmb9F+I
        cFVywLUpZ3TUeGjWyH1JxlvkfH6lHIzZgcZX05rRGqZduyP3T52OS3SiVrCtOmApJ1On/LrPvMh
        sZWhbfHbEec1blKMevEIm
X-Received: by 2002:a1c:6302:: with SMTP id x2mr4646098wmb.56.1605306930818;
        Fri, 13 Nov 2020 14:35:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx16goPmTkQI33BXjPuhsGv1l1ZNJDXKJH2RZQichX2X24coMGN7jfwISuAuamqZjVj9g86Ww==
X-Received: by 2002:a1c:6302:: with SMTP id x2mr4646082wmb.56.1605306930644;
        Fri, 13 Nov 2020 14:35:30 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id g20sm11435472wmh.20.2020.11.13.14.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 14:35:29 -0800 (PST)
Subject: Re: [PATCH 2/2] kernel-doc: Handle function typedefs without
 asterisks
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Eduardo Habkost <ehabkost@redhat.com>
References: <20201030144713.201372-1-pbonzini@redhat.com>
 <20201030144713.201372-3-pbonzini@redhat.com>
 <20201113152106.7b4a07ee@lwn.net>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0b42c1b4-e730-5403-dc28-303b32622727@redhat.com>
Date:   Fri, 13 Nov 2020 23:35:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113152106.7b4a07ee@lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 13/11/20 23:21, Jonathan Corbet wrote:
>>
>> Signed-off-by: Eduardo Habkost<ehabkost@redhat.com>
>> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> So as you've undoubtedly noticed, reading those kernel-doc regexes is ... a
> wee bit on the painful side.  Trying to compare two of them in a patch to
> figure out what you have done is even worse.  I suspect we want these
> patches, but can you please supply a changelog that describes the change?
> 

Seems like some of Mauro's recent patches take care of the same thing. 
I'm going to update QEMU's kernel-doc, and if there's anything left to 
do I'll resend.

Thanks,

Paolo

