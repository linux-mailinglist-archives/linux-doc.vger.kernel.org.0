Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99FAF195A4A
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2020 16:51:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727549AbgC0Pvn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Mar 2020 11:51:43 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:38618 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgC0Pvm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Mar 2020 11:51:42 -0400
Received: by mail-qt1-f196.google.com with SMTP id z12so8928437qtq.5
        for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2020 08:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m8e1t2URI8U7vsMzc9OwFUvFf9TchHday/nZmdlm/Bc=;
        b=XvzIk11ZgUsdpnfnuoichso6upeqV2Fr6l3tyzOo5JKIkUELWesJaX8XSghz6si3tD
         xXRm2ovbTBK2aS1SptYapKH5L778NQZ0wXK+y++E/Y3aqyitiUEJ9yvE7dcOcls2gkX3
         G4wnpAHNQAe8i+B2MFW9fxmioVMs544R1zkKK02CSeICz9leLhZmPFN/pEtGv1NRftNE
         9a1vI+58/uweZP6JMlx0iwVGIBWhSTndYgpbN0lCaFx9nDkBCRT05OQU0VIPQr04VJxL
         CotSzb297EAD8vP52+rw2GCqXW2VTlVwqs+8GrqnVrE9fd9hD0yoL6AnzxkzkZS6Rd6R
         Annw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m8e1t2URI8U7vsMzc9OwFUvFf9TchHday/nZmdlm/Bc=;
        b=c7fnSsaMyX8dmCoFRHo0NO81i6sEFT3LEqIhGJP6k3fsHP1AFqa04ovJQ8ygx9boRH
         snQQPWb38cp5axgz+PzPlsvGMYmUl43txYaF0D5hc49rpiCE64cwOeTtfJ9CNkGIlE9V
         5ahzbwJyq4irG6NTOe8Xg1oC+DP4BtS7zGqpE4yEqh4uBuUyv0JGJjXMb5qWYpgUR7cA
         XIyWv6VZK2VM7g6vBJhS29JqKchibzZjjwFcXiyNEquif+iDKKz8ohTdW+OxTTvPZeU2
         eDnyA/WNDzCmeTP9Xah9WVZ6p/XArB0NqZmD5yhvQLw/t0lTTf2gTDfaEtufiWAZ0a65
         lf7g==
X-Gm-Message-State: ANhLgQ1xt64Jt/Vs6qTqgNFCkHDhSxJvWtduYnQic/C8NI3SpPK9yz1o
        YFvz2zYAMcTR8w+FJo2kXart/w==
X-Google-Smtp-Source: ADFU+vs7IQPv1SwKkkfEK42tDG3IIZh7dDMSegkFSdNrKQY6L07g3w09IacJgdU3HOCbM7FKaYHRGw==
X-Received: by 2002:aed:2415:: with SMTP id r21mr5456624qtc.82.1585324299805;
        Fri, 27 Mar 2020 08:51:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id d2sm3967804qkl.98.2020.03.27.08.51.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 08:51:39 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jHrGk-0002JY-Io; Fri, 27 Mar 2020 12:51:38 -0300
Date:   Fri, 27 Mar 2020 12:51:38 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Dennis Dalessandro <dennis.dalessandro@intel.com>,
        Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org
Subject: Re: [PATCH 14/17] infiniband: pa_vnic_encap.h: get rid of a warning
Message-ID: <20200327155138.GX20941@ziepe.ca>
References: <cover.1584456635.git.mchehab+huawei@kernel.org>
 <9dce702510505556d75a13d9641e09218a4b4a65.1584456635.git.mchehab+huawei@kernel.org>
 <20200319003645.GH20941@ziepe.ca>
 <20200327153226.1fed1835@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327153226.1fed1835@coco.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 27, 2020 at 03:32:26PM +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 18 Mar 2020 21:36:45 -0300
> Jason Gunthorpe <jgg@ziepe.ca> escreveu:
> 
> > On Tue, Mar 17, 2020 at 03:54:23PM +0100, Mauro Carvalho Chehab wrote:
> > > The right markup for a variable is @foo, and not @foo[].
> > > 
> > > Using a wrong markup caused this warning:
> > > 
> > > 	./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:243: WARNING: Inline strong start-string without end-string.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > >  drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)  
> > 
> > Do you want this to go to the RDMA tree? I wasn't cc'd on the cover
> > letter
> 
> Sorry for not answering earlier. Got sidetracked with other things.
> 
> Yeah, if there are still time, feel free to pick it. Otherwise, 
> I'll likely send again after the merge window, to be applied either 
> by you or via the docs tree.

Sure, done

Thanks,
Jason
