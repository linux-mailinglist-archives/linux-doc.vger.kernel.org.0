Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1B452325F
	for <lists+linux-doc@lfdr.de>; Wed, 11 May 2022 14:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237997AbiEKMCP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 May 2022 08:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234541AbiEKMCO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 May 2022 08:02:14 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47EED64BF5;
        Wed, 11 May 2022 05:02:11 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 8F8091F8E7;
        Wed, 11 May 2022 12:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1652270530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wMGXgiVD6AX+NtSdZZDZThWGjXA0j3exZsA4f3T/vqo=;
        b=FgosRKKBYjiDEm6ZYGSRX5PQpbiCvPGUUY2VkanSTYoqM0uGZLCIdj2O0fxEC1yC5g1v0p
        Iiu1xMdQHG/MuOZPxWt062mlo+x2bRTlnk1DVwTwLYR687RjtYlzF62QWstWKk8pgAopAB
        HdhwhvVwO+FQi/PV8APu3/h/8YYJtZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1652270530;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wMGXgiVD6AX+NtSdZZDZThWGjXA0j3exZsA4f3T/vqo=;
        b=qAra8utGXhwrhsSEQPawnxRhfl/E9VHM8R342DS20hD4KSNBaEyzqfJjWxYsqDFaJ3jNO6
        DHUni6sXX6W6dHAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5DC2B13A76;
        Wed, 11 May 2022 12:02:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id gEPnFcKle2JbWAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 11 May 2022 12:02:10 +0000
Message-ID: <67ed69d1-ebea-c9d0-45be-3c6c7e5ea1e5@suse.de>
Date:   Wed, 11 May 2022 14:02:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 2/7] firmware: sysfb: Add helpers to unregister a pdev
 and disable registration
Content-Language: en-US
To:     Javier Martinez Canillas <javierm@redhat.com>,
        linux-kernel@vger.kernel.org
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511112438.1251024-3-javierm@redhat.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220511112438.1251024-3-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------L0NE00rJyEzzbK4o1BR9mHIL"
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------L0NE00rJyEzzbK4o1BR9mHIL
Content-Type: multipart/mixed; boundary="------------nXYnfa6lSBk1ozk0riCcHIgB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Message-ID: <67ed69d1-ebea-c9d0-45be-3c6c7e5ea1e5@suse.de>
Subject: Re: [PATCH v5 2/7] firmware: sysfb: Add helpers to unregister a pdev
 and disable registration
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511112438.1251024-3-javierm@redhat.com>
In-Reply-To: <20220511112438.1251024-3-javierm@redhat.com>

--------------nXYnfa6lSBk1ozk0riCcHIgB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDExLjA1LjIyIHVtIDEzOjI0IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBUaGVzZSBjYW4gYmUgdXNlZCBieSBzdWJzeXN0ZW1zIHRvIHVucmVnaXN0ZXIg
YSBwbGF0Zm9ybSBkZXZpY2UgcmVnaXN0ZXJlZA0KPiBieSBzeXNmYiBhbmQgYWxzbyB0byBk
aXNhYmxlIGZ1dHVyZSBwbGF0Zm9ybSBkZXZpY2UgcmVnaXN0cmF0aW9uIGluIHN5c2ZiLg0K
PiANCj4gU3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmll
cm1AcmVkaGF0LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+DQo+IC0tLQ0KPiANCj4gKG5vIGNoYW5nZXMgc2luY2UgdjQpDQo+
IA0KPiBDaGFuZ2VzIGluIHY0Og0KPiAtIE1ha2Ugc3lzZmJfZGlzYWJsZSgpIHRvIGFsc28g
YXR0ZW1wdCB0byB1bnJlZ2lzdGVyIGEgZGV2aWNlLg0KPiANCj4gQ2hhbmdlcyBpbiB2MjoN
Cj4gLSBBZGQga2VybmVsLWRvYyBjb21tZW50cyBhbmQgaW5jbHVkZSBpbiBvdGhlcl9pbnRl
cmZhY2VzLnJzdCAoRGFuaWVsIFZldHRlcikuDQo+IA0KPiAgIC4uLi9kcml2ZXItYXBpL2Zp
cm13YXJlL290aGVyX2ludGVyZmFjZXMucnN0ICB8ICA2ICsrDQo+ICAgZHJpdmVycy9maXJt
d2FyZS9zeXNmYi5jICAgICAgICAgICAgICAgICAgICAgIHwgODcgKysrKysrKysrKysrKysr
KystLQ0KPiAgIGluY2x1ZGUvbGludXgvc3lzZmIuaCAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDE5ICsrKysNCj4gICAzIGZpbGVzIGNoYW5nZWQsIDEwNiBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZHJpdmVy
LWFwaS9maXJtd2FyZS9vdGhlcl9pbnRlcmZhY2VzLnJzdCBiL0RvY3VtZW50YXRpb24vZHJp
dmVyLWFwaS9maXJtd2FyZS9vdGhlcl9pbnRlcmZhY2VzLnJzdA0KPiBpbmRleCBiODE3OTRl
MGNmYmIuLjA2YWM4OWFkYWFmYiAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2
ZXItYXBpL2Zpcm13YXJlL290aGVyX2ludGVyZmFjZXMucnN0DQo+ICsrKyBiL0RvY3VtZW50
YXRpb24vZHJpdmVyLWFwaS9maXJtd2FyZS9vdGhlcl9pbnRlcmZhY2VzLnJzdA0KPiBAQCAt
MTMsNiArMTMsMTIgQEAgRUREIEludGVyZmFjZXMNCj4gICAuLiBrZXJuZWwtZG9jOjogZHJp
dmVycy9maXJtd2FyZS9lZGQuYw0KPiAgICAgIDppbnRlcm5hbDoNCj4gICANCj4gK0dlbmVy
aWMgU3lzdGVtIEZyYW1lYnVmZmVycyBJbnRlcmZhY2UNCj4gKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gKw0KPiArLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMv
ZmlybXdhcmUvc3lzZmIuYw0KPiArICAgOmV4cG9ydDoNCj4gKw0KPiAgIEludGVsIFN0cmF0
aXgxMCBTb0MgU2VydmljZSBMYXllcg0KPiAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiAgIFNvbWUgZmVhdHVyZXMgb2YgdGhlIEludGVsIFN0cmF0aXgxMCBTb0Mg
cmVxdWlyZSBhIGxldmVsIG9mIHByaXZpbGVnZQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9m
aXJtd2FyZS9zeXNmYi5jIGIvZHJpdmVycy9maXJtd2FyZS9zeXNmYi5jDQo+IGluZGV4IGIw
MzJmNDBhOTJkZS4uNjc2ODk2ODk0OWU2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2Zpcm13
YXJlL3N5c2ZiLmMNCj4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9zeXNmYi5jDQo+IEBAIC0z
NCwyMSArMzQsOTIgQEANCj4gICAjaW5jbHVkZSA8bGludXgvc2NyZWVuX2luZm8uaD4NCj4g
ICAjaW5jbHVkZSA8bGludXgvc3lzZmIuaD4NCj4gICANCj4gK3N0YXRpYyBzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZDsNCj4gK3N0YXRpYyBERUZJTkVfTVVURVgoZGlzYWJsZV9sb2Nr
KTsNCj4gK3N0YXRpYyBib29sIGRpc2FibGVkOw0KPiArDQo+ICtzdGF0aWMgYm9vbCBzeXNm
Yl91bnJlZ2lzdGVyKHZvaWQpDQo+ICt7DQo+ICsJaWYgKElTX0VSUl9PUl9OVUxMKHBkKSkN
Cj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArDQo+ICsJcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0
ZXIocGQpOw0KPiArCXBkID0gTlVMTDsNCj4gKw0KPiArCXJldHVybiB0cnVlOw0KPiArfQ0K
PiArDQo+ICsvKioNCj4gKyAqIHN5c2ZiX2Rpc2FibGUoKSAtIGRpc2FibGUgdGhlIEdlbmVy
aWMgU3lzdGVtIEZyYW1lYnVmZmVycyBzdXBwb3J0DQo+ICsgKg0KPiArICogVGhpcyBkaXNh
YmxlcyB0aGUgcmVnaXN0cmF0aW9uIG9mIHN5c3RlbSBmcmFtZWJ1ZmZlciBkZXZpY2VzIHRo
YXQgbWF0Y2ggdGhlDQo+ICsgKiBnZW5lcmljIGRyaXZlcnMgdGhhdCBtYWtlIHVzZSBvZiB0
aGUgc3lzdGVtIGZyYW1lYnVmZmVyIHNldCB1cCBieSBmaXJtd2FyZS4NCj4gKyAqDQo+ICsg
KiBJdCBhbHNvIHVucmVnaXN0ZXJzIGEgZGV2aWNlIGlmIHRoaXMgd2FzIGFscmVhZHkgcmVn
aXN0ZXJlZCBieSBzeXNmYl9pbml0KCkuDQoNCldoeT8gSSBzdGlsbCBjYW5ub3Qgd3JhcCBt
eSBtaW5kIGFyb3VuZCwgd2h5IHdlIG5lZWQgdG8gc3RvcmUgKnBkIGF0IGFsbCANCmFuZCB1
c2Ugc3lzZmJfdHJ5X3VucmVnaXN0ZXIoKSBmb3IgdW5yZWdpc3RlcmluZy4NCg0KPiArICoN
Cj4gKyAqIENvbnRleHQ6IFRoZSBmdW5jdGlvbiBjYW4gc2xlZXAuIEEgQGRpc2FibGVfbG9j
ayBtdXRleCBpcyBhY3F1aXJlZCB0byBzZXJpYWxpemUNCj4gKyAqICAgICAgICAgIGFnYWlu
c3Qgc3lzZmJfaW5pdCgpLCB0aGF0IHJlZ2lzdGVycyBhIHN5c3RlbSBmcmFtZWJ1ZmZlciBk
ZXZpY2UgYW5kDQo+ICsgKiAgICAgICAgICBzeXNmYl90cnlfdW5yZWdpc3RlcigpLCB0aGF0
IHRyaWVzIHRvIHVucmVnaXN0ZXIgYSBmcmFtZWJ1ZmZlciBkZXZpY2UuDQo+ICsgKi8NCj4g
K3ZvaWQgc3lzZmJfZGlzYWJsZSh2b2lkKQ0KPiArew0KPiArCW11dGV4X2xvY2soJmRpc2Fi
bGVfbG9jayk7DQo+ICsJc3lzZmJfdW5yZWdpc3RlcigpOw0KPiArCWRpc2FibGVkID0gdHJ1
ZTsNCj4gKwltdXRleF91bmxvY2soJmRpc2FibGVfbG9jayk7DQo+ICt9DQo+ICtFWFBPUlRf
U1lNQk9MX0dQTChzeXNmYl9kaXNhYmxlKTsNCj4gKw0KPiArLyoqDQo+ICsgKiBzeXNmYl90
cnlfdW5yZWdpc3RlcigpIC0gYXR0ZW1wdCB0byB1bnJlZ2lzdGVyIGEgc3lzdGVtIGZyYW1l
YnVmZmVyIGRldmljZQ0KPiArICogQGRldjogZGV2aWNlIHRvIHVucmVnaXN0ZXINCj4gKyAq
DQo+ICsgKiBUaGlzIHRyaWVzIHRvIHVucmVnaXN0ZXIgYSBzeXN0ZW0gZnJhbWVidWZmZXIg
ZGV2aWNlIGlmIHRoaXMgd2FzIHJlZ2lzdGVyZWQNCj4gKyAqIGJ5IHRoZSBHZW5lcmljIFN5
c3RlbSBGcmFtZWJ1ZmZlcnMuIFRoZSBkZXZpY2Ugd2lsbCBvbmx5IGJlIHVucmVnaXN0ZXJl
ZCBpZg0KPiArICogaXQgd2FzIHJlZ2lzdGVyZWQgYnkgc3lzZmJfaW5pdCgpLCBvdGhlcndp
c2UgaXQgd2lsbCBub3QgYmUgdW5yZWdpc3RlcmVkLg0KPiArICoNCj4gKyAqIENvbnRleHQ6
IFRoZSBmdW5jdGlvbiBjYW4gc2xlZXAuIGEgQGxvYWRfbG9jayBtdXRleCBpcyBhY3F1aXJl
ZCB0byBzZXJpYWxpemUNCj4gKyAqICAgICAgICAgIGFnYWluc3Qgc3lzZmJfaW5pdCgpLCB0
aGF0IHJlZ2lzdGVycyBhIHNpbXBsZSBmcmFtZWJ1ZmZlciBkZXZpY2UgYW5kDQo+ICsgKiAg
ICAgICAgICBzeXNmYl9kaXNhYmxlKCksIHRoYXQgZGlzYWJsZXMgdGhlIEdlbmVyaWMgU3lz
dGVtIEZyYW1lYnVmZmVycyBzdXBwb3J0Lg0KPiArICoNCj4gKyAqIFJldHVybjoNCj4gKyAq
ICogdHJ1ZSAgICAgICAgICAtIHRoZSBkZXZpY2Ugd2FzIHVucmVnaXN0ZXJlZCBzdWNjZXNz
ZnVsbHkNCj4gKyAqICogZmFsc2UgICAgICAgICAtIHRoZSBkZXZpY2Ugd2FzIG5vdCB1bnJl
Z2lzdGVyZWQNCj4gKyAqLw0KPiArYm9vbCBzeXNmYl90cnlfdW5yZWdpc3RlcihzdHJ1Y3Qg
ZGV2aWNlICpkZXYpDQoNCkFzIGl0IHN0YW5kcywgSSBzdHJvbmdseSBvYmplY3QgdGhlIHVz
ZSBvZiB0aGlzIGZ1bmN0aW9uIGFzIHN0aWxsIGRvbid0IA0KcmVhbGx5IGdldCB0aGUgcHVy
cG9zZS4gSXQgbG9va3MgbGlrZSBhIGdsb3JpZmllZCB3cmFwcGVyIGFyb3VuZCANCnBsYXRm
b3JtX2RldmljZV91bnJlZ2lzdGVyKCkuIERvIHdlIG5lZWQgZGlzYWJsZV9sb2NrIHRvIHNl
cmlhbGl6ZSB3aXRoIA0Kc29tZXRoaW5nIGVsc2U/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCg0KPiArew0KPiArCWJvb2wgcmV0ID0gZmFsc2U7DQo+ICsNCj4gKwltdXRleF9sb2Nr
KCZkaXNhYmxlX2xvY2spOw0KPiArCWlmIChJU19FUlJfT1JfTlVMTChwZCkgfHwgcGQgIT0g
dG9fcGxhdGZvcm1fZGV2aWNlKGRldikpDQo+ICsJCWdvdG8gdW5sb2NrX211dGV4Ow0KPiAr
DQo+ICsJcmV0ID0gc3lzZmJfdW5yZWdpc3RlcigpOw0KPiArDQo+ICt1bmxvY2tfbXV0ZXg6
DQo+ICsJbXV0ZXhfdW5sb2NrKCZkaXNhYmxlX2xvY2spOw0KPiArCXJldHVybiByZXQ7DQo+
ICt9DQo+ICtFWFBPUlRfU1lNQk9MX0dQTChzeXNmYl90cnlfdW5yZWdpc3Rlcik7DQo+ICsN
Cj4gICBzdGF0aWMgX19pbml0IGludCBzeXNmYl9pbml0KHZvaWQpDQo+ICAgew0KPiAgIAlz
dHJ1Y3Qgc2NyZWVuX2luZm8gKnNpID0gJnNjcmVlbl9pbmZvOw0KPiAgIAlzdHJ1Y3Qgc2lt
cGxlZmJfcGxhdGZvcm1fZGF0YSBtb2RlOw0KPiAtCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkOw0KPiAgIAljb25zdCBjaGFyICpuYW1lOw0KPiAgIAlib29sIGNvbXBhdGlibGU7DQo+
IC0JaW50IHJldDsNCj4gKwlpbnQgcmV0ID0gMDsNCj4gKw0KPiArCW11dGV4X2xvY2soJmRp
c2FibGVfbG9jayk7DQo+ICsJaWYgKGRpc2FibGVkKQ0KPiArCQlnb3RvIHVubG9ja19tdXRl
eDsNCj4gICANCj4gICAJLyogdHJ5IHRvIGNyZWF0ZSBhIHNpbXBsZS1mcmFtZWJ1ZmZlciBk
ZXZpY2UgKi8NCj4gICAJY29tcGF0aWJsZSA9IHN5c2ZiX3BhcnNlX21vZGUoc2ksICZtb2Rl
KTsNCj4gICAJaWYgKGNvbXBhdGlibGUpIHsNCj4gICAJCXBkID0gc3lzZmJfY3JlYXRlX3Np
bXBsZWZiKHNpLCAmbW9kZSk7DQo+ICAgCQlpZiAoIUlTX0VSUihwZCkpDQo+IC0JCQlyZXR1
cm4gMDsNCj4gKwkJCWdvdG8gdW5sb2NrX211dGV4Ow0KPiAgIAl9DQo+ICAgDQo+ICAgCS8q
IGlmIHRoZSBGQiBpcyBpbmNvbXBhdGlibGUsIGNyZWF0ZSBhIGxlZ2FjeSBmcmFtZWJ1ZmZl
ciBkZXZpY2UgKi8NCj4gQEAgLTYwLDggKzEzMSwxMCBAQCBzdGF0aWMgX19pbml0IGludCBz
eXNmYl9pbml0KHZvaWQpDQo+ICAgCQluYW1lID0gInBsYXRmb3JtLWZyYW1lYnVmZmVyIjsN
Cj4gICANCj4gICAJcGQgPSBwbGF0Zm9ybV9kZXZpY2VfYWxsb2MobmFtZSwgMCk7DQo+IC0J
aWYgKCFwZCkNCj4gLQkJcmV0dXJuIC1FTk9NRU07DQo+ICsJaWYgKCFwZCkgew0KPiArCQly
ZXQgPSAtRU5PTUVNOw0KPiArCQlnb3RvIHVubG9ja19tdXRleDsNCj4gKwl9DQo+ICAgDQo+
ICAgCXN5c2ZiX2FwcGx5X2VmaV9xdWlya3MocGQpOw0KPiAgIA0KPiBAQCAtNzMsOSArMTQ2
LDExIEBAIHN0YXRpYyBfX2luaXQgaW50IHN5c2ZiX2luaXQodm9pZCkNCj4gICAJaWYgKHJl
dCkNCj4gICAJCWdvdG8gZXJyOw0KPiAgIA0KPiAtCXJldHVybiAwOw0KPiArCWdvdG8gdW5s
b2NrX211dGV4Ow0KPiAgIGVycjoNCj4gICAJcGxhdGZvcm1fZGV2aWNlX3B1dChwZCk7DQo+
ICt1bmxvY2tfbXV0ZXg6DQo+ICsJbXV0ZXhfdW5sb2NrKCZkaXNhYmxlX2xvY2spOw0KPiAg
IAlyZXR1cm4gcmV0Ow0KPiAgIH0NCj4gICANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvc3lzZmIuaCBiL2luY2x1ZGUvbGludXgvc3lzZmIuaA0KPiBpbmRleCA3MDgxNTJlOTAz
N2IuLmU4YzAzMTNmYWM4ZiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9zeXNmYi5o
DQo+ICsrKyBiL2luY2x1ZGUvbGludXgvc3lzZmIuaA0KPiBAQCAtNTUsNiArNTUsMjUgQEAg
c3RydWN0IGVmaWZiX2RtaV9pbmZvIHsNCj4gICAJaW50IGZsYWdzOw0KPiAgIH07DQo+ICAg
DQo+ICsjaWZkZWYgQ09ORklHX1NZU0ZCDQo+ICsNCj4gK3ZvaWQgc3lzZmJfZGlzYWJsZSh2
b2lkKTsNCj4gK2Jvb2wgc3lzZmJfdHJ5X3VucmVnaXN0ZXIoc3RydWN0IGRldmljZSAqZGV2
KTsNCj4gKw0KPiArI2Vsc2UgLyogQ09ORklHX1NZU0ZCICovDQo+ICsNCj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCBzeXNmYl9kaXNhYmxlKHZvaWQpDQo+ICt7DQo+ICsNCj4gK30NCj4gKw0K
PiArc3RhdGljIGlubGluZSBib29sIHN5c2ZiX3RyeV91bnJlZ2lzdGVyKHN0cnVjdCBkZXZp
Y2UgKmRldikNCj4gK3sNCj4gKwlyZXR1cm4gZmFsc2U7DQo+ICt9DQo+ICsNCj4gKyNlbmRp
ZiAvKiBDT05GSUdfU1lTRkIgKi8NCj4gKw0KPiAgICNpZmRlZiBDT05GSUdfRUZJDQo+ICAg
DQo+ICAgZXh0ZXJuIHN0cnVjdCBlZmlmYl9kbWlfaW5mbyBlZmlmYl9kbWlfbGlzdFtdOw0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------nXYnfa6lSBk1ozk0riCcHIgB--

--------------L0NE00rJyEzzbK4o1BR9mHIL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ7pcEFAwAAAAAACgkQlh/E3EQov+A7
QxAAnz9HmMpLbZ14HsWeZ7F5Job4+zSdoEHNSUUqSGGvM/uTpW6yCbMdc45+M7gUavSsK3E/ZL1s
44+CKIRKrVAXwv62eECS3pXZEgtXpzLkj82WInjHUjhpdZdqpFFQDG30qsALxoi+hCeoYIEBbzjQ
eWCkCcWj/fZrOFlvneBwHaBbEwVXzmrvyFgTSbZGu2pQhwu66m3bRGmn5/LKOGB1wKIwi/uaJc8O
8ErlNpTdo1COjcwt0gOZWGuEjIEg/2Ylj2l6y2+q37njZp+DLpLhMwgOOjoU6CahO5WsyBPxu33Q
yddGAAaydXmAKOrjbZp3B06sNqB58B1ZCYuU6Mku0WJRAaQMq2oQ7iDlbKYQNMx3mfRVEhaO86xC
ibuSgIdazq3EREvpg3z5KGdTXHiERoYzLQPKG5EPYASSHAwvg38lirB2IW76BchNoqRVys2QYL//
XwoRkx8C3QTd2Aa4LBU+FehKWA9WQiUXwUxrtF8+HpVm2ztf5qUUcNQKZlpK2GEfNSghd8l2pPNL
/h0GnndKdlt2TiuvJXrR6ty54EV68ya9AOGsJ2PAyr8Vjm2hlDCvFwSukm+67dDitfk9JJgKiwRx
t/Lpmrn+cxd9SwhyZ51V2aXQAKgaPQHwPh/knIzUo5WFC5JaaLyl196rtS/LcJ/4YpfIDBD2cxuK
wgw=
=Xri6
-----END PGP SIGNATURE-----

--------------L0NE00rJyEzzbK4o1BR9mHIL--
