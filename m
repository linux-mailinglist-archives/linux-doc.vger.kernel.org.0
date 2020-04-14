Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A43941A8AD8
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2020 21:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504806AbgDNTeF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 14 Apr 2020 15:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2504851AbgDNTdk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Apr 2020 15:33:40 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD9EC061A41
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2020 12:33:39 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id v38so496016qvf.6
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2020 12:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8dnkQ9M3xI6On5BSh1/mhM6wNLNSVaCuNmJxtnHMKQk=;
        b=j02DrJAJJMYYgQIUy1JTsUOwROPiKWFCYonh6yaIg0yjBkI7sW/ZCXWHB3l802npmp
         bYy2/EcDTPLn0/iuzVb4x85UU2Nq/ZY9dpCCfTjXBFNaq2BW8zidhYBYt7AzkbTyHqEx
         fKxdQ+E96b4q2cb28IOD47KEjHifg7tVjb1lW0i+y87/rHdkfki3d0DcOUJOtws4hOnI
         6LuC08+F3VlCgq9il2WJHfDhUMyMRo6bZYUy7sUS+lWgsIe9HVl+E7zL3JuvGCTIy7CE
         UFSJwifhn/w8dAKoeXJHnUc4V/hSx+Cy827SG0+Y5fH46DOr95sbY2ZqL45CmGPZm0XQ
         kAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8dnkQ9M3xI6On5BSh1/mhM6wNLNSVaCuNmJxtnHMKQk=;
        b=rW7Nd6BnUmdB+DEWK90aeSubzci5gO/EJym6Aw5oXdPTtq2rk5WhQH1/PVn0XnfDWR
         XBi+iXNRRXZKVg5j1uDxTqUDJHqw0sG7uRP+J2NvdRATFO20qAqi/Lh7mfnMaIN6qVsU
         1TXm4y+70vhgfsVtfsvzlL8NZtBUnK+P6NDr6XhBtURVDJQueOtfZK6x0ky3zng7ehYg
         PVGu7LXBVmmTMg/GINEjQV7IbNMaevSwwJs+T3pPT/W99insNN1l0uvn8d944JQA+l9A
         HWxnElE9njrTbyFGUTF6Hga1j1ifE1ojhXXjDEmMOVdEomkLYWjhpwBvahS5tQl8Xg3d
         aYMw==
X-Gm-Message-State: AGi0PuZMDF1XdeB0TAL2X9uk0FXwZpVf7iJaSAV9o+pmHEMia+7rhMwE
        HBTdLOSgXY61lZ9oc08pK9fLcQ==
X-Google-Smtp-Source: APiQypL0GLPU2qVCJsM0kf2FXn3IWzAgvpM/edl/Z91YfQTa69LDuZZfAydhjhxbF4ueX1QhOkOzNw==
X-Received: by 2002:a0c:e092:: with SMTP id l18mr1565731qvk.116.1586892818419;
        Tue, 14 Apr 2020 12:33:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id o6sm5702880qkj.126.2020.04.14.12.33.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 12:33:37 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jORJR-0005TM-EB; Tue, 14 Apr 2020 16:33:37 -0300
Date:   Tue, 14 Apr 2020 16:33:37 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org
Subject: Re: [PATCH v2 17/33] docs: infiniband: verbs.c: fix some
 documentation warnings
Message-ID: <20200414193337.GA20929@ziepe.ca>
References: <cover.1586881715.git.mchehab+huawei@kernel.org>
 <4c5466d0f450c5a9952138150c3485740b37f9c5.1586881715.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c5466d0f450c5a9952138150c3485740b37f9c5.1586881715.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 14, 2020 at 06:48:43PM +0200, Mauro Carvalho Chehab wrote:
> Parsing this file with kernel-doc produce some warnings:
> 
> 	./drivers/infiniband/core/verbs.c:2579: WARNING: Unexpected indentation.
> 	./drivers/infiniband/core/verbs.c:2581: WARNING: Block quote ends without a blank line; unexpected unindent.
> 	./drivers/infiniband/core/verbs.c:2613: WARNING: Unexpected indentation.
> 	./drivers/infiniband/core/verbs.c:2579: WARNING: Unexpected indentation.
> 	./drivers/infiniband/core/verbs.c:2581: WARNING: Block quote ends without a blank line; unexpected unindent.
> 	./drivers/infiniband/core/verbs.c:2613: WARNING: Unexpected indentation.
> 
> Address them by adding an extra blank line and converting the
> parameters on one of the arguments to a table.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/infiniband/core/verbs.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

As before we can take RDMA patches through the RDMA tree, so applied
to for-next

Thanks,
Jason
