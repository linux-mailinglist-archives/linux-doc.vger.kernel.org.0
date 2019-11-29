Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB1210D989
	for <lists+linux-doc@lfdr.de>; Fri, 29 Nov 2019 19:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfK2STE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 29 Nov 2019 13:19:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58666 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726970AbfK2STE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Nov 2019 13:19:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575051542;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FiyrhdgENs34vIhSRSTGRDggmyyimwC96XAb9yeIB6k=;
        b=UOujqduoFl5F6cHcKxnZjs1qcby4eEY4Tt0in3X1YCGHUodQrG5w4h/blIJTOOevuSO6OP
        b0VRJttUgq9awq/cWbkfdCln2xGDVo2riC3QUx+HdvwEi9HCKQpexl5zerfFM9gQnZ9gYi
        vhe5CrIxKNKL6JWE74mPzjpHxl8tzPI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-kjssIbcfPR-njA5Z_YosCQ-1; Fri, 29 Nov 2019 13:19:01 -0500
Received: by mail-wm1-f71.google.com with SMTP id p5so4718756wmc.4
        for <linux-doc@vger.kernel.org>; Fri, 29 Nov 2019 10:19:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FiyrhdgENs34vIhSRSTGRDggmyyimwC96XAb9yeIB6k=;
        b=OvynmjR3ehuoYUWON5tOY1aRlwcc9Wr53knu6IEBaf6QOAAgr9/pXhfYp0cGcT8jGj
         p8ayVNoaANax27BR+UU4raucwSFbjGNzjXN6SHtx5eCxg2LvD1vK1Q8+tVK6D1CARiZe
         mum4cmdc38r+ufpjdcCyeZjhl+xYbHZyqHarZ4jLfbs7dpMkYxJACWjQBtSvXEKLuBIP
         whqb/53565FqQReKljw/OFGmNaU08+ZVHEWbKNTnPeceqgPa8n/QXlzgkySaBO+qYePo
         VtFo2h3AKlzSmTg3zL9rIXhUwx5QGtk76l5K0LqiTD+JwqS5+Vy/ryUxgRKNUClAk+Fj
         qEJA==
X-Gm-Message-State: APjAAAW/cJ1Gqr2I4eNKSErFZYbAmRROhQRJDlY1ixWmn7B9zashy/fN
        dluQZy/Qg8dC+cQUZpYqh4E2dhJ3R705Tb1Pgg6KG1M/lOm8QMbNxVgRD7P04+uwTC8gPq8/xfd
        z9FO5zEfSl9Tg7xre+7Kb
X-Received: by 2002:adf:ea4e:: with SMTP id j14mr7028872wrn.101.1575051540404;
        Fri, 29 Nov 2019 10:19:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqzBCDg/+xrc9KqzOZsoX1fdWUXz3f/n/RYBgMN+X+O1eMFce6efVhgwcEb8hu7gTdmmmfm3sg==
X-Received: by 2002:adf:ea4e:: with SMTP id j14mr7028844wrn.101.1575051540104;
        Fri, 29 Nov 2019 10:19:00 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:56e1:adff:fed9:caf0? ([2001:b07:6468:f312:56e1:adff:fed9:caf0])
        by smtp.gmail.com with ESMTPSA id m3sm13546140wrs.53.2019.11.29.10.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2019 10:18:59 -0800 (PST)
Subject: Re: [PATCH] Documentation: kvm: Fix mention to number of ioctls
 classes
To:     Wainer dos Santos Moschetta <wainersm@redhat.com>,
        rkrcmar@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org
References: <20191129181730.15037-1-wainersm@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <67bb9781-98a5-fcad-b958-04abe42b37fb@redhat.com>
Date:   Fri, 29 Nov 2019 19:18:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191129181730.15037-1-wainersm@redhat.com>
Content-Language: en-US
X-MC-Unique: kjssIbcfPR-njA5Z_YosCQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/11/19 19:17, Wainer dos Santos Moschetta wrote:
> In api.txt it is said that KVM ioctls belong to three classes
> but in reality it is four. Fixed this, but do not count categories
> anymore to avoid such as outdated information in the future.
> 
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  Documentation/virt/kvm/api.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/api.txt b/Documentation/virt/kvm/api.txt
> index 4833904d32a5..4e3d22429b19 100644
> --- a/Documentation/virt/kvm/api.txt
> +++ b/Documentation/virt/kvm/api.txt
> @@ -5,7 +5,7 @@ The Definitive KVM (Kernel-based Virtual Machine) API Documentation
>  ----------------------
>  
>  The kvm API is a set of ioctls that are issued to control various aspects
> -of a virtual machine.  The ioctls belong to three classes:
> +of a virtual machine.  The ioctls belong to the following classes:
>  
>   - System ioctls: These query and set global attributes which affect the
>     whole kvm subsystem.  In addition a system ioctl is used to create
> 

Queued, thanks.

Paolo

