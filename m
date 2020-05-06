Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F931C761B
	for <lists+linux-doc@lfdr.de>; Wed,  6 May 2020 18:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729706AbgEFQTm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 May 2020 12:19:42 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23775 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729239AbgEFQTm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 May 2020 12:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588781981;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2GKepkm35dnbxL0GRcTMB1GSJjAjSbjaZHFzrucw9MU=;
        b=BF/57BWoFbih3NVRDgcXDCbnDTpTD1ETyIRmn0Faqn0fICwlW8BtYLsdAm7Z5XT2F3W5yy
        2O+5+mX81I+9t8yoIJw9AFg3dEg3pqJzRFwLJObmU8MPNCthhF69ENAnmCbMv2p9MyLVCj
        3EQRBYPNg875pYRDIHC+9IJ/HcJlulY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-Bkox4T9tOHuNT_4Svzzcng-1; Wed, 06 May 2020 12:19:37 -0400
X-MC-Unique: Bkox4T9tOHuNT_4Svzzcng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E171107ACCD;
        Wed,  6 May 2020 16:19:35 +0000 (UTC)
Received: from llong.remote.csb (ovpn-116-141.rdu2.redhat.com [10.10.116.141])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A029299D2;
        Wed,  6 May 2020 16:19:33 +0000 (UTC)
Subject: Re: [PATCH] doc: Fix some typo errors in ras.rst
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Tony Luck <tony.luck@intel.com>,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rrichter@marvell.com>,
        linux-edac@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200505151049.11134-1-longman@redhat.com>
 <20200505154816.GH16070@bombadil.infradead.org>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <eae29941-683c-4501-d3f0-8c33532e8975@redhat.com>
Date:   Wed, 6 May 2020 12:19:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200505154816.GH16070@bombadil.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/5/20 11:48 AM, Matthew Wilcox wrote:
> On Tue, May 05, 2020 at 11:10:49AM -0400, Waiman Long wrote:
>> Fix typo errors.
> By reformatting it, you've successfully obscured what typos you've fixed.
> As a result I read the whole paragraph, and ...
>
>>   ECC memory
>>   ----------
>>   
>> -As mentioned on the previous section, ECC memory has extra bits to be
>> -used for error correction. So, on 64 bit systems, a memory module
>> -has 64 bits of *data width*, and 74 bits of *total width*. So, there are
>> -8 bits extra bits to be used for the error detection and correction
>> +As mentioned on the previous section, ECC memory has extra bits to
> s/on/in/
>
>> +be used for error correction. So, on 64 bit systems, a memory module
>> +has 64 bits of *data width*, and 72 bits of *total width*.
> Usually a 64-bit system refers to the width of a pointer.  Here, it's
> referring to the width of the memory system, which is rather confusing.
> How about "In the above example" instead of "So, on 64 bit systems".
>
>> So, there
>> +are 8 extra bits to be used for the error detection and correction
>>   mechanisms. Those extra bits are called *syndrome*\ [#f1]_\ [#f2]_.
> This would read better as:
>
> The extra 8 bits which are used for error detection and correction
> are referred to as the *syndrome*\ [#f1]_\ [#f2]_.
>
Thanks for the suggestion. Will incorporate that in v2.

-Longman

