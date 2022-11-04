Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A569D6195B9
	for <lists+linux-doc@lfdr.de>; Fri,  4 Nov 2022 13:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbiKDMBp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 4 Nov 2022 08:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiKDMBo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Nov 2022 08:01:44 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37FA2CE12
        for <linux-doc@vger.kernel.org>; Fri,  4 Nov 2022 05:01:41 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id d26so12627372eje.10
        for <linux-doc@vger.kernel.org>; Fri, 04 Nov 2022 05:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vX+vHMerL5hHGi61mVjg2SjrLuNX/dpteaaUy7kX49c=;
        b=QlkBKA6E5Ko3njgfowi9h2uzByHYAyboTpo9aNYaXvtUZHENEoPu2saKsxUWNZOfsV
         iQxg0tq2V+YgjYxY3m9tAsjPbcHvAmqIu6yB+8qp3myamnieWtwXjoKI76VbILuQxsiy
         ZDwePE9GMKfidzdctFqDAp3iD3clxwq11vEco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vX+vHMerL5hHGi61mVjg2SjrLuNX/dpteaaUy7kX49c=;
        b=KS1+6VPj0fnxEYO9A0WHbFVJYb/dGTmzU11UQJViwrLawXlYT7wkljQX1jf5+KHh6P
         4zbyVinPNA2JQEjxd54hMOW/YVarG+s2xtqVcFUi1ezCyVt5sd2u9H0jtZpKiiH/4w/A
         QiI6D/ODuqn/EsisG7751+FN8IjcgwahaWI+L75MYYNYWfs7tTgRjeG/ZIoRKkwtG4yv
         UhjUfT9Gp4osM3ZU2ffjUZELFDTljvOPVJFv5FUd/8xUhXlykEzdaXTK2QoncYfG7F64
         YVzZWxLHjJCb8pwGIfAHvvSDxayzkDWpXbvJgdlCodPk9Uf/arzzhDyW8vjyO/tlWVne
         h6Xg==
X-Gm-Message-State: ACrzQf0aM594Lp7epXiJFnC+gFtccX06RtgCRRVK2YB/fT4irObNgJbN
        fRfWyUxeaMRI+eT5ZG8yYy2hIJuM8bXo+CAchE+1dA==
X-Google-Smtp-Source: AMsMyM6mDYswgIgpsprXU9bC+eoma9ou1JVT4oMbNBk2sOraDL01o7sOUZ+7MUocpEIA5r2zX6Hgo2W37/DFZ0GBZ/k=
X-Received: by 2002:a17:906:7948:b0:7ac:d6f9:eb3e with SMTP id
 l8-20020a170906794800b007acd6f9eb3emr33206517ejo.350.1667563300137; Fri, 04
 Nov 2022 05:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221030115209.25924-1-akiyks@gmail.com>
In-Reply-To: <20221030115209.25924-1-akiyks@gmail.com>
From:   Tsugikazu Shibata <shibata@linuxfoundation.org>
Date:   Fri, 4 Nov 2022 21:01:28 +0900
Message-ID: <CAO+cJp20skpBaWwG+yoRJtwv+L98HYfonZxc_qfEZL2JJp_9EA@mail.gmail.com>
Subject: Re: [PATCH] docs/ja_JP/howto: Update for v6.1
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kosuke Fujimoto <fujimotokosuke0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gU3VuLCBPY3QgMzAsIDIwMjIgYXQgODo1MiBQTSBBa2lyYSBZb2tvc2F3YSA8YWtpeWtzQGdt
YWlsLmNvbT4gd3JvdGU6DQo+DQo+IFJlZmxlY3QgY2hhbmdlcyBtYWRlIGluIGNvbW1pdHMgbGlz
dGVkIGJlbG93Og0KPg0KPiAgIDM4OGY5YjIwZjk4ZCAoIkRvY3VtZW50YXRpb24vcHJvY2Vzcy9o
b3d0bzogT25seSBzZW5kIHJlZ3Jlc3Npb24gZml4ZXMgYWZ0ZXIgLXJjMSIpLg0KPiAgIGJjMGVm
NGE3ZTRjMyAoIkRvYzogRGVsZXRlIHJlZmVyZW5jZSB0byB0aGUga2VybmVsLW1lbnRvcnMgbWFp
bGluZyBsaXN0IikNCj4gICBiY2QzY2YwODU1YzUgKCJEb2M6IFJlbW92ZSBvdXRkYXRlZCBpbmZv
IGFib3V0IGJ1Z3ppbGxhIG1haWxpbmcgbGlzdHMiKQ0KPiAgIGRhZDA1MTM5NTQxMyAoIkRvYzog
YWRkIGEgbWlzc2luZyBjcm9zcy1yZWZlcmVuY2UiKQ0KPiAgIDk3OTk0NDVhZjEyNCAoIkRvYzog
dGlkeSB1cCBUT0NzIGFuZCByZWZzIHRvIGxpY2Vuc2UtcnVsZXMucnN0IikNCj4gICBmYjBlMGZm
ZTdmYzggKCJEb2N1bWVudGF0aW9uOiBicmluZyBwcm9jZXNzIGRvY3MgdXAgdG8gZGF0ZSIpDQo+
ICAgZTdiNDMxMWViY2FjICgiUmVwbGFjZSBIVFRQIGxpbmtzIHdpdGggSFRUUFMgb25lczogRG9j
dW1lbnRhdGlvbi9wcm9jZXNzIikNCj4gICBmMWVlYmU5MmMyNjUgKCJEb2N1bWVudGF0aW9uL0hP
V1RPOiBhZGp1c3QgZXh0ZXJuYWwgbGluayByZWZlcmVuY2VzIikNCj4gICBkYTUxNDE1N2M0ZjAg
KCJkb2NzOiBtYWtlIHJlcG9ydGluZy1idWdzLnJzdCBvYnNvbGV0ZSIpDQo+ICAgY2Y2ZDZmYzI3
OTM2ICgiZG9jczogcHJvY2Vzcy9ob3d0by5yc3Q6IG1ha2Ugc2VjdGlvbnMgb24gYnVnIHJlcG9y
dGluZyBtYXRjaCBwcmFjdGljZSIpDQo+DQo+IENvLWRldmVsb3BlZC1ieTogS29zdWtlIEZ1amlt
b3RvIDxmdWppbW90b2tvc3VrZTBAZ21haWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBLb3N1a2Ug
RnVqaW1vdG8gPGZ1amltb3Rva29zdWtlMEBnbWFpbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFr
aXJhIFlva29zYXdhIDxha2l5a3NAZ21haWwuY29tPg0KPiBDYzogVHN1Z2lrYXp1IFNoaWJhdGEg
PHNoaWJhdGFAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gLS0tDQo+IEJyaWVmIGhpc3Rvcnkgb2Yg
dGhlIGNoYW5nZToNCj4NCj4gSSAoQWtpcmEpIGFza2VkIEtvc3VrZSBvZiB1cGRhdGluZyBqYV9K
UC9ob3d0by5yc3QgYWZ0ZXIgdGhlIG1lcmdlIG9mDQo+IGhpcyBlYXJsaWVyIGNvbnRyaWJ1dGlv
bnM6DQo+ICAgZTBiZDZmMTRjMjhmICgiZG9jcy9qYV9KUC9pbmRleDogdXBkYXRlIHNlY3Rpb24g
dGl0bGUgaW4gSmFwYW5lc2UiKQ0KPiAgIDY1NDhlOTZlZGI1MCAoImRvY3MvdHJhbnMvamFfSlAv
aG93dG86IERvbid0IG1lbnRpb24gc3BlY2lmaWMga2VybmVsIHZlcnNpb25zIikNCj4NCj4gS29z
dWtlIG1hZGUgaGlzIFdJUCBjb21taXRzIHB1YmxpYyBhdDoNCj4gICAgIGh0dHBzOi8vZ2l0aHVi
LmNvbS9Lb3N1a2VGdWppbW90by9saW51eC90cmVlL1dJUC1kb2NzLWphLWpwLWhvd3RvDQo+DQo+
IEhlIG1vdmVkIG92ZXIgdG8gb3RoZXIgcmVzcG9uc2liaWxpdGllcyBzb29uIGFmdGVyIGFuZCBj
b3VsZCBub3QgbWFrZQ0KPiB0aGVtIHJlYWR5IGZvciBzdWJtaXNzaW9uLiBTZWVpbmcgYWxtb3N0
IGhhbGYgYSB5ZWFyIGhhZCBwYXNzZWQgd2l0aG91dA0KPiBhbnkgYWN0aXZpdHksIEkgdG9vayBv
dmVyIGFuZCBhc3NlbWJsZWQgdGhvc2Ugc21hbGwgY2hhbmdlcyBpbnRvIGEgc2luZ2xlDQo+IHBh
dGNoLg0KPg0KPiBJIHBpY2tlZCBLb3N1a2UncyBTLW8tYiBmcm9tIGhpcyBnaXRodWIgY29tbWl0
cy4NCj4gQXMgSSBhbHNvIGltcHJvdmVkIHNvbWUgb2YgdHJhbnNsYXRpb25zIGFsb25nIHRoZSB3
YXksIEkgYXNzaWduZWQgbXlzZWxmDQo+IGFzIHRoZSBhdXRob3IgYW5kIGFkZGVkIEtvc3VrZSdz
IGNvLWRldmVsb3BlZC1ieSB0YWcuDQo+DQo+IFNoaWJhdGEtc2FuLCBob3BlZnVsbHkgY2FuIHlv
dSByZXZpZXcgdGhpcyB1cGRhdGU/DQo+DQo+IEpvbiwgSSdsbCBhc2sgeW91IHdoZW4gSSBmZWVs
IGxpa2UgdGhpcyBvbmUgaXMgcmVhZHkgdG8gYmUgYXBwbGllZC4NCj4NCj4gICAgICAgICBUaGFu
a3MsIEFraXJhDQo+IC0tDQo+ICBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy9qYV9KUC9ob3d0
by5yc3QgfCA2NiArKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMzEg
aW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy9qYV9KUC9ob3d0by5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy9qYV9KUC9ob3d0by5yc3QNCj4gaW5kZXggYjhlZWI0NWEwMmQ0Li45YjBiMzQzNmRm
Y2YgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL2phX0pQL2hvd3Rv
LnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy9qYV9KUC9ob3d0by5yc3QN
Cj4gQEAgLTg2LDkgKzg2LDE0IEBAIGluZm8g44Oa44O844K4KCBpbmZvIGdjYyAp44KS6KaL44Gm
44GP44Gg44GV44GE44CCDQo+ICAtLS0tLS0tLQ0KPg0KPiAgTGludXgg44Kr44O844ON44Or44Gu
44K944O844K544Kz44O844OJ44GvIEdQTCDjg6njgqTjgrvjg7Pjgrnjga7kuIvjgafjg6rjg6rj
g7zjgrnjgZXjgozjgabjgYTjgb4NCj4gLeOBmeOAguODqeOCpOOCu+ODs+OCueOBruips+e0sOOB
q+OBpOOBhOOBpuOBr+OAgeOCveODvOOCueODhOODquODvOOBruODoeOCpOODs+ODh+OCo+ODrOOC
r+ODiOODquOBq+WtmOWcqA0KPiAt44GZ44KL44CBQ09QWUlORyDjga7jg5XjgqHjgqTjg6vjgpLo
povjgabjgY/jgaDjgZXjgYTjgILjgoLjgZfjg6njgqTjgrvjg7PjgrnjgavjgaTjgYTjgabjgZXj
gonjgavos6oNCj4gLeWVj+OBjOOBguOCjOOBsOOAgUxpbnV4IEtlcm5lbCDjg6Hjg7zjg6rjg7Pj
grDjg6rjgrnjg4jjgavos6rllY/jgZnjgovjga7jgafjga/jgarjgY/jgIHjganjgYbjgZ4NCj4g
K+OBmeOAguOCveODvOOCueODhOODquODvOOBruODoeOCpOODs+ODh+OCo+ODrOOCr+ODiOODquOB
q+OBguOCiyBDT1BZSU5HIOOBruODleOCoeOCpOODq+OCkuimi+OBpuOBjw0KPiAr44Gg44GV44GE
44CCTGludXgg44Kr44O844ON44Or44Gu44Op44Kk44K744Oz44K544Or44O844Or44Go44K944O8
44K544Kz44O844OJ5YaF44GuDQo+ICtgU1BEWCA8aHR0cHM6Ly9zcGR4Lm9yZy8+YF8g6K2Y5Yil
5a2Q44Gu5L2/44GE5pa544GvDQo+ICs6cmVmOmBEb2N1bWVudGF0aW9uL3Byb2Nlc3MvbGljZW5z
ZS1ydWxlcy5yc3QgPGtlcm5lbF9saWNlbnNpbmc+YA0KPiAr44Gr6Kqs5piO44GV44KM44Gm44GE
44G+44GZ44CCDQo+ICsNCj4gK+OCguOBl+ODqeOCpOOCu+ODs+OCueOBq+OBpOOBhOOBpuOBleOC
ieOBq+izquWVj+OBjOOBguOCjOOBsOOAgQ0KPiArTGludXggS2VybmVsIOODoeODvOODquODs+OC
sOODquOCueODiOOBq+izquWVj+OBmeOCi+OBruOBp+OBr+OBquOBj+OAgeOBqeOBhuOBng0KPiAg
5rOV5b6L5a6244Gr55u46KuH44GX44Gm44GP44Gg44GV44GE44CC44Oh44O844Oq44Oz44Kw44Oq
44K544OI44Gu5Lq66YGU44Gv5rOV5b6L5a6244Gn44Gv44Gq44GP44CB5rOV55qEDQo+ICDllY/p
oYzjgavjgaTjgYTjgabjga/lvbzjgonjga7lo7DmmI7jga/jgYLjgabjgavjgZnjgovjgbnjgY3j
gafjga/jgYLjgorjgb7jgZvjgpPjgIINCj4NCj4gQEAgLTExMSw3ICsxMTYsNyBAQCBsaW51eC1h
cGlAdmdlci5rZXJuZWwub3JnIOOBq+mAgeOCi+OBk+OBqOOCkuWLp+OCgeOBvuOBmeOAgg0KPiAg
5Lul5LiL44Gv44Kr44O844ON44Or44K944O844K544OE44Oq44O844Gr5ZCr44G+44KM44Gm44GE
44KL6Kqt44KT44Gn44GK44GP44G544GN44OV44Kh44Kk44Or44Gu5LiA6Kan44GnDQo+ICDjgZkt
DQo+DQo+IC0gIFJFQURNRQ0KPiArICA6cmVmOmBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL1JF
QURNRS5yc3QgPHJlYWRtZT5gDQo+ICAgICAg44GT44Gu44OV44Kh44Kk44Or44GvIExpbnV444Kr
44O844ON44Or44Gu57Ch5Y2Y44Gq6IOM5pmv44Go44Kr44O844ON44Or44KS6Kit5a6aKOios+az
qA0KPiAgICAgIGNvbmZpZ3VyZSAp44GX44CB55Sf5oiQKOios+azqCBidWlsZCAp44GZ44KL44Gf
44KB44Gr5b+F6KaB44Gq44GT44Go44Gv5L2V44GL44GM5pu444GL44KMDQo+ICAgICAg44Gm44GE
44G+44GZ44CCIOOCq+ODvOODjeODq+OBq+mWouOBl+OBpuWIneOCgeOBpuOBruS6uuOBr+OBk+OB
k+OBi+OCieOCueOCv+ODvOODiOOBmeOCi+OBqOiJr+OBhA0KPiBAQCAtMTQ1LDcgKzE1MCw4IEBA
IGxpbnV4LWFwaUB2Z2VyLmtlcm5lbC5vcmcg44Gr6YCB44KL44GT44Go44KS5Yun44KB44G+44GZ
44CCDQo+ICAgICAg44GT44Gu5LuW44Gr44OR44OD44OB44KS5L2c44KL5pa55rOV44Gr44Gk44GE
44Gm44Gu44KI44GP44Gn44GN44Gf6KiY6L+w44GvLQ0KPg0KPiAgICAgICAgICJUaGUgUGVyZmVj
dCBQYXRjaCINCj4gLSAgICAgICAgICAgICAgIGh0dHA6Ly93d3cub3psYWJzLm9yZy9+YWtwbS9z
dHVmZi90cHAudHh0DQo+ICsgICAgICAgICAgICAgICBodHRwczovL3d3dy5vemxhYnMub3JnL35h
a3BtL3N0dWZmL3RwcC50eHQNCj4gKw0KPiAgICAgICAgICJMaW51eCBrZXJuZWwgcGF0Y2ggc3Vi
bWlzc2lvbiBmb3JtYXQiDQo+ICAgICAgICAgICAgICAgICBodHRwczovL3dlYi5hcmNoaXZlLm9y
Zy93ZWIvMjAxODA4MjkxMTI0NTAvaHR0cDovL2xpbnV4Lnl5ei51cy9wYXRjaC1mb3JtYXQuaHRt
bA0KPg0KPiBAQCAtMjM3LDEzICsyNDMsNiBAQCBMaW51eCDjgqvjg7zjg43jg6vjgr3jg7zjgrnj
g4Tjg6rjg7zjga7kuK3jgavlkKvjgb7jgozjgovjgIHjgY3jgozjgYTjgavjgZfjgIENCj4gIOOC
jOOCi+OBn+OCgeOBruWfuuekjuOCkuWtpuOBtuOBk+OBqOOBjOOBp+OBjeOAgeOBneOBl+OBpuOC
guOBl+OBguOBquOBn+OBjOOBvuOBoOOCouOCpOODh+OCo+OCouOCkuaMgeOBow0KPiAg44Gm44GE
44Gq44GE5aC05ZCI44Gr44Gv44CB5qyh44Gr44KE44KL5LuV5LqL44Gu5pa55ZCR5oCn44GM6KaL
44GI44Gm44GP44KL44GL44KC44GX44KM44G+44Gb44KT44CCDQo+DQo+IC3jgoLjgZfjgYLjgarj
gZ/jgYzjgIHjgZnjgafjgavjgbLjgajjgb7jgajjgb7jgorjgrPjg7zjg4njgpLmm7jjgYTjgabj
gYTjgabjgIHjgqvjg7zjg43jg6vjg4Tjg6rjg7zjgavlhaUNCj4gLeOCjOOBn+OBhOOBqOaAneOB
o+OBpuOBhOOBn+OCiuOAgeOBneOCjOOBq+mWouOBmeOCi+mBqeWIh+OBquaUr+aPtOOCkuaxguOC
geOBn+OBhOWgtOWQiOOAgeOCq+ODvOODjeODq+ODoQ0KPiAt44Oz44K/44O844K644OX44Ot44K4
44Kn44Kv44OI44Gv44Gd44Gu44KI44GG44Gq55qG44GV44KT44KS5Yqp44GR44KL44Gf44KB44Gr
44Gn44GN44G+44GX44Gf44CC44GT44GT44GrDQo+IC3jga/jg6Hjg7zjg6rjg7PjgrDjg6rjgrnj
g4jjgYzjgYLjgorjgIHku6XkuIvjgYvjgonlj4LnhafjgafjgY3jgb7jgZkgLQ0KPiAtDQo+IC0g
ICAgICAgaHR0cHM6Ly9zZWxlbmljLmNvbS9tYWlsbWFuL2xpc3RpbmZvL2tlcm5lbC1tZW50b3Jz
DQo+IC0NCj4gIOWun+mam+OBqyBMaW51eCDjgqvjg7zjg43jg6vjga7jgrPjg7zjg4njgavjgaTj
gYTjgabkv67mraPjgpLliqDjgYjjgovliY3jgavjgIHjganjgYbjgoTjgaPjgabjgZ3jga4NCj4g
IOOCs+ODvOODieOBjOWLleS9nOOBmeOCi+OBruOBi+OCkueQhuino+OBmeOCi+OBk+OBqOOBjOW/
heimgeOBp+OBmeOAguOBneOBruOBn+OCgeOBq+OBr+OAgeeJueWIpeOBquODhOODvA0KPiAg44Or
44Gu5Yqp44GR44KS5YCf44KK44Gm44Gn44KC44CB44Gd44KM44KS55u05o6l44KI44GP6Kqt44KA
44GT44Go44GM5pyA6Imv44Gu5pa55rOV44Gn44GZKOOBu+OBqOOCk+OBqQ0KPiBAQCAtMjgwLDkg
KzI3OSwxMSBAQCBodHRwczovL2tlcm5lbC5vcmcg44Gu44Oq44Od44K444OI44Oq44Gr5a2Y5Zyo
44GX44G+44GZ44CCDQo+ICAgICAg5aSn44GN44Gq5aSJ5pu044GvIGdpdCjjgqvjg7zjg43jg6vj
ga7jgr3jg7zjgrnnrqHnkIbjg4Tjg7zjg6vjgIHoqbPntLDjga8NCj4gICAgICBodHRwOi8vZ2l0
LXNjbS5jb20vIOWPgueFpykg44KS5L2/44Gj44Gm6YCB44KL44Gu44GM5aW944G+44GX44GE44KE
44KK5pa544Gn44GZ44GM44CB44OR44ODDQo+ICAgICAg44OB44OV44Kh44Kk44Or44Gu5b2i5byP
44Gu44G+44G+6YCB44KL44Gu44Gn44KC5Y2B5YiG44Gn44GZ44CCDQo+IC0gIC0gMumAsemWk+W+
jOOAgS1yYzEg44Kr44O844ON44Or44GM44Oq44Oq44O844K544GV44KM44CB44GT44Gu5b6M44Gr
44Gv44Kr44O844ON44Or5YWo5L2T44Gu5a6J5a6aDQo+IC0gICAg5oCn44Gr5b2x6Z+/44KS44GC
44Gf44GI44KL44KI44GG44Gq5paw5qmf6IO944Gv5ZCr44G+44Gq44GE6aGe44Gu44OR44OD44OB
44GX44GL5Y+W44KK6L6844KA44GT44GoDQo+IC0gICAg44Gv44Gn44GN44G+44Gb44KT44CC5paw
44GX44GE44OJ44Op44Kk44OQKOOCguOBl+OBj+OBr+ODleOCoeOCpOODq+OCt+OCueODhuODoCnj
ga7jg5Hjg4Pjg4Hjga8NCj4gKyAgLSAy6YCx6ZaT5b6MIC1yYzEg44Kr44O844ON44Or44GM44Oq
44Oq44O844K544GV44KM44CB5paw44GX44GE44Kr44O844ON44Or44KS5Y+v6IO944Gq6ZmQ44KK
5aCF54mi44GrDQo+ICsgICAg44GZ44KL44GT44Go44Gr54Sm54K544GM56e744KK44G+44GZ44CC
44GT44Gu5pyf6ZaT44Gu44OR44OD44OB44Gu44G744Go44KT44Gp44Gv6YCA6KGM44KS5L+u5q2j
44GZ44KLDQo+ICsgICAg44KC44Gu44Go44Gq44KK44G+44GZ44CC5Lul5YmN44GL44KJ5a2Y5Zyo
44GX44Gm44GE44Gf44OQ44Kw44Gv6YCA6KGM44Gr44Gv5b2T44Gf44KJ44Gq44GE44Gf44KB44CB
DQo+ICsgICAg6YCB44KL44Gu44Gv6YeN6KaB44Gq5L+u5q2j44Gg44GR44Gr44GX44Gm44GP44Gg
44GV44GE44CCDQo+ICsgICAg5paw44GX44GE44OJ44Op44Kk44OQICjjgoLjgZfjgY/jga/jg5Xj
gqHjgqTjg6vjgrfjgrnjg4bjg6ApIOOBruODkeODg+ODgeOBrw0KPiAgICAgIC1yYzEg44Gu5b6M
44Gn5Y+X44GR5LuY44GR44KJ44KM44KL44GT44Go44KC44GC44KL44GT44Go44KS6Kaa44GI44Gm
44GK44GE44Gm44GP44Gg44GV44GE44CC44GqDQo+ICAgICAg44Gc44Gq44KJ44CB5aSJ5pu044GM
54us56uL44GX44Gm44GE44Gm44CB6L+95Yqg44GV44KM44Gf44Kz44O844OJ44Gu5aSW44Gu6aCY
5Z+f44Gr5b2x6Z+/44KS5LiO44GIDQo+ICAgICAg44Gq44GE6ZmQ44KK44CB6YCA6KGM44Gu44Oq
44K544Kv44Gv54Sh44GE44GL44KJ44Gn44GZ44CCLXJjMSDjgYzjg6rjg6rjg7zjgrnjgZXjgozj
gZ/lvozjgIENCj4gQEAgLTMwOCw5ICszMDksMTIgQEAgQW5kcmV3IE1vcnRvbiDjgYwgTGludXgt
a2VybmVsIOODoeODvOODquODs+OCsOODquOCueODiOOBq+OCq+ODvOODjeODq+ODquODquODvA0K
Pg0KPiAg44OQ44O844K444On44Oz55Wq5Y+344GMM+OBpOOBruaVsOWtl+OBq+WIhuOBi+OCjOOB
puOBhOOCi+OCq+ODvOODjeODq+OBryAtc3RhYmxlIOOCq+ODvOODjeODq+OBp+OBmeOAgg0KPiAg
44GT44KM44Gr44Gv5pyA5Yid44GuMuOBpOOBruODkOODvOOCuOODp+ODs+eVquWPt+OBruaVsOWt
l+OBq+WvvuW/nOOBl+OBn+OAgQ0KPiAt44Oh44Kk44Oz44Op44Kk44Oz44Oq44Oq44O844K544Gn
6KaL44Gk44GL44Gj44Gf44K744Kt44Ol44Oq44OG44Kj5ZWP6aGM44KEDQo+ICvjg6Hjgrjjg6Pj
g7zjg6HjgqTjg7Pjg6njgqTjg7Pjg6rjg6rjg7zjgrnjgafopovjgaTjgYvjgaPjgZ/jgrvjgq3j
g6Xjg6rjg4bjgqPllY/poYzjgoQNCj4gIOmHjeWkp+OBquW+jOaIu+OCiuOBq+WvvuOBmeOCi+av
lOi8g+eahOWwj+OBleOBhOmHjeimgeOBquS/ruato+OBjOWQq+OBvuOCjOOBvuOBmeOAgg0KPg0K
PiAr44Oh44K444Oj44O85a6J5a6a54mI44K344Oq44O844K644Gu44Gd44KM44Ge44KM44Gu44Oq
44Oq44O844K544GvDQo+ICvjg5Djg7zjgrjjg6fjg7Pnlarlj7fjga4z55Wq55uu44KS5aKX5Yqg
44GV44Gb44CB5pyA5Yid44GuMuOBpOOBrueVquWPt+OBr+WQjOOBmOWApOOCkuS/neOBoeOBvuOB
meOAgg0KPiArDQo+ICDjgZPjgozjga/jgIHplovnmbov5a6f6aiT55qE44OQ44O844K444On44Oz
44Gu44OG44K544OI44Gr5Y2U5Yqb44GZ44KL44GT44Go44Gr6IiI5ZGz44GM54Sh44GP44CB5pyA
5pawDQo+ICDjga7lronlrprjgZfjgZ/jgqvjg7zjg43jg6vjgpLkvb/jgYTjgZ/jgYTjg6bjg7zj
grbjgavmjqjlpajjgZnjgovjg5bjg6njg7Pjg4HjgafjgZnjgIINCj4NCj4gQEAgLTM2NiwxNiAr
MzcwLDEwIEBAIGxpbnV4LW5leHQg44Gu5a6f6KGM44OG44K544OI44KS6KGM44GG5YaS6Zm65aW9
44GN44Gq44OG44K544K/44O844Gv5aSn44GE44Gr5q2TDQo+ICDjg5DjgrDjg6zjg53jg7zjg4gN
Cj4gIC0tLS0tLS0tLS0tLS0NCj4NCj4gLWh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZyDjga8g
TGludXgg44Kr44O844ON44Or6ZaL55m66ICF44GM44Kr44O844ON44Or44Gu44OQ44Kw44KS6L+9
6Leh44GZ44KLDQo+IC3loLTmiYDjgafjgZnjgILjg6bjg7zjgrbjga/opovjgaTjgZHjgZ/jg5Dj
grDjga7lhajjgabjgpLjgZPjga7jg4Tjg7zjg6vjgafloLHlkYrjgZnjgbnjgY3jgafjgZnjgILj
ganjgYYNCj4gLWtlcm5lbCBidWd6aWxsYSDjgpLkvb/jgYbjgYvjga7oqbPntLDjga/jgIHku6Xk
uIvjgpLlj4LnhafjgZfjgabjgY/jgaDjgZXjgYQgLQ0KPiAtDQo+IC0gICAgICAgaHR0cHM6Ly9i
dWd6aWxsYS5rZXJuZWwub3JnL3BhZ2UuY2dpP2lkPWZhcS5odG1sDQo+IC0NCj4gIOODoeOCpOOD
s+OCq+ODvOODjeODq+OCveODvOOCueODh+OCo+ODrOOCr+ODiOODquOBq+OBguOCi+ODleOCoeOC
pOODqw0KPiAtYWRtaW4tZ3VpZGUvcmVwb3J0aW5nLWJ1Z3MucnN044Gv44Kr44O844ON44Or44OQ
44Kw44KJ44GX44GE44KC44Gu44Gr44Gk44GE44Gm44Gp44GG44Os44Od44O8DQo+IC3jg4jjgZnj
govjgYvjga7oia/jgYTjg4bjg7Pjg5fjg6zjg7zjg4jjgafjgYLjgorjgIHllY/poYzjga7ov73o
t6HjgpLliqnjgZHjgovjgZ/jgoHjgavjgqvjg7zjg43jg6vplovnmboNCj4gLeiAheOBq+OBqOOB
o+OBpuOBqeOCk+OBquaDheWgseOBjOW/heimgeOBquOBruOBi+OBruips+e0sOOBjOabuOOBi+OC
jOOBpuOBhOOBvuOBmeOAgg0KPiArJ0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcmVwb3J0aW5n
LWlzc3Vlcy5yc3QnDQo+ICvjga/jgIHjgqvjg7zjg43jg6vjg5DjgrDjgonjgZfjgY3jgoLjga7j
ga7loLHlkYrjga7ku5XmlrnjgIHjgYrjgojjgbPjgIHjgqvjg7zjg43jg6vplovnmbrogIXjgYzl
lY/poYzjgpINCj4gK+i/vei3oeOBmeOCi+mam+OBruaJi+OBjOOBi+OCiuOBqOOBquOCi+aDheWg
seOBq+OBpOOBhOOBpuOBruips+e0sOOCkuiqrOaYjuOBl+OBpuOBhOOBvuOBmeOAgg0KPg0KPiAg
44OQ44Kw44Os44Od44O844OI44Gu566h55CGDQo+ICAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+IEBA
IC0zODgsMTUgKzM4NiwxMyBAQCBhZG1pbi1ndWlkZS9yZXBvcnRpbmctYnVncy5yc3Tjga/jgqvj
g7zjg43jg6vjg5DjgrDjgonjgZfjgYTjgoLjga7jgavjgaTjgYTjgaYNCj4gIOmBk+OBp+OBmeOA
geOBquOBnOOBquOCieWkmuOBj+OBruS6uuOBr+S7luS6uuOBruODkOOCsOOBruS/ruato+OBq+aZ
gumWk+OCkua1quiyu+OBmeOCi+OBk+OBqOOCkuWlveOBvuOBqg0KPiAg44GE44GL44KJ44Gn44GZ
44CCDQo+DQo+IC3jgZnjgafjgavjg6zjg53jg7zjg4jjgZXjgozjgZ/jg5DjgrDjga7jgZ/jgoHj
gavku5XkuovjgpLjgZnjgovjgZ/jgoHjgavjga/jgIENCj4gLWh0dHBzOi8vYnVnemlsbGEua2Vy
bmVsLm9yZyDjgavooYzjgaPjgabjgY/jgaDjgZXjgYTjgILjgoLjgZfku4rlvozjga7jg5DjgrDj
g6zjg53jg7zjg4jjgasNCj4gLeOBpOOBhOOBpuOCouODieODkOOCpOOCueOCkuWPl+OBkeOBn+OB
hOOBruOBp+OBguOCjOOBsOOAgWJ1Z21lLW5ldyDjg6Hjg7zjg6rjg7PjgrDjg6rjgrnjg4go5paw
44GXDQo+IC3jgYTjg5DjgrDjg6zjg53jg7zjg4jjgaDjgZHjgYzjgZPjgZPjgavjg6Hjg7zjg6vj
gZXjgozjgospIOOBvuOBn+OBryBidWdtZS1qYW5pdG9yIOODoeODvOODquODsw0KPiAt44Kw44Oq
44K544OIKGJ1Z3ppbGxhIOOBruWkieabtOavjuOBq+OBk+OBk+OBq+ODoeODvOODq+OBleOCjOOC
iynjgpLos7zoqq3jgafjgY3jgb7jgZnjgIINCj4gLQ0KPiAtICAgICAgIGh0dHBzOi8vbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9idWdtZS1uZXcNCj4gLQ0KPiAt
ICAgICAgIGh0dHBzOi8vbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWdtZS1qYW5pdG9ycw0KPiAr44GZ44Gn44Gr44Os44Od44O844OI44GV44KM44Gf44OQ44Kw
44Gu5L2c5qWt44KS44GZ44KL44Gf44KB44Gr44Gv44CB6IiI5ZGz44Gu44GC44KL44K144OW44K3
44K544OG44Og44KSDQo+ICvopovjgaTjgZHjgIHjgZ3jga7jgrXjg5bjgrfjgrnjg4bjg6Djga7j
g5DjgrDjga7loLHlkYrlhYggKOWkmuOBj+OBruWgtOWQiOODoeODvOODquODs+OCsOODquOCueOD
iOOAgQ0KPiAr56iA44Gr44OQ44Kw44OI44Op44OD44Kr44O8KSDjgpIgTUFJTlRBSU5FUlMg44OV
44Kh44Kk44Or44Gn6Kq/44G544Gm44GP44Gg44GV44GE44CCDQo+ICvjgZ3jga7jgqLjg7zjgqvj
gqTjg5bjgafmnIDov5Hjga7loLHlkYrjgpLmpJzntKLjgZfjgIHjgafjgY3jgZ3jgYbjgarjgoLj
ga7jgavlipvjgpLosrjjgZfjgabjgY/jgaDjgZXjgYTjgIINCj4gK2h0dHBzOi8vYnVnemlsbGEu
a2VybmVsLm9yZyDjgafjg5DjgrDloLHlkYrjgpLoqr/jgbnjgojjgYbjgajjgZnjgovkurrjgoLj
gYTjgovjgafjgZfjgofjgYbjgIINCj4gK+OBk+OCjOOBr+mZkOOCieOCjOOBn+S4gOmDqOOBruOC
teODluOCt+OCueODhuODoOOBruODkOOCsOWgseWRiuOBqOi/vei3oeOBq+WIqeeUqOOBleOCjOOC
i+OBqOOBqOOCguOBq+OAgQ0KPiAr44Go44KK44KP44GR44CB44Kr44O844ON44Or5YWo5L2T44Gr
5a++44GZ44KL44OQ44Kw44Gu55m76Yyy5YWI44Go44Gq44Gj44Gm44GE44G+44GZ44CCDQo+DQo+
ICDjg6Hjg7zjg6rjg7PjgrDjg6rjgrnjg4gNCj4gIC0tLS0tLS0tLS0tLS0tLS0NCj4gQEAgLTYy
MSw3ICs2MTcsNyBAQCBMaW51eCDjgqvjg7zjg43jg6vjgrPjg5/jg6Xjg4vjg4bjgqPjga/jgIHk
uIDluqbjgavlpKfph4/jga7jgrPjg7zjg4njga7loYrjgpINCj4gIOODs+ODiOOBriBDaGFuZ2VM
b2cg44K744Kv44K344On44Oz44KS6KaL44Gm44GP44Gg44GV44GEIC0NCj4NCj4gICAgIlRoZSBQ
ZXJmZWN0IFBhdGNoIg0KPiAtICAgICAgaHR0cDovL3d3dy5vemxhYnMub3JnL35ha3BtL3N0dWZm
L3RwcC50eHQNCj4gKyAgICAgIGh0dHBzOi8vd3d3Lm96bGFicy5vcmcvfmFrcG0vc3R1ZmYvdHBw
LnR4dA0KPg0KPiAg44GT44KM44KJ44Gv44Gp44KM44KC44CB5a6f6KGM44GZ44KL44GT44Go44GM
5pmC44Gr44Gv44Go44Gm44KC5Zuw6Zuj44Gn44GZ44CC44GT44KM44KJ44Gu5L6L44KS5a6M55Kn
44GrDQo+ICDlrp/mlr3jgZnjgovjgavjga/mlbDlubTjgYvjgYvjgovjgYvjgoLjgZfjgozjgb7j
gZvjgpPjgILjgZPjgozjga/ntpnntprnmoTjgarmlLnlloTjga7jg5fjg63jgrvjgrnjgafjgYIN
Cj4NCj4gYmFzZS1jb21taXQ6IGY5MDdiZjYzMGU5YzA1N2U4MGY0ODgzZDVlMWEzZDlhMzk1YmI2
ZDINCj4gLS0NCj4gMi4yNS4xDQoNClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoZXMgYW5kIGFsbCB0
aGUgcGF0Y2hlcyBsb29rIGdvb2QgdG8gbWUuDQpBY2tlZC1ieTogVHN1Z2lrYXp1IFNoaWJhdGEg
PHNoaWJhdGFAbGludXhmb3VuZGF0aW9uLm9yZz4NCg0KVHN1Z2lrYXp1IFNoaWJhdGENCg==
